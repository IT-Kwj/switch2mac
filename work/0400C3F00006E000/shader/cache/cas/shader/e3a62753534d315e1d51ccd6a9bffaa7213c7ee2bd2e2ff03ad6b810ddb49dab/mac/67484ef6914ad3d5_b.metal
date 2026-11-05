#pragma clang diagnostic ignored "-Wmissing-prototypes"

#include <metal_stdlib>
#include <simd/simd.h>

using namespace metal;

struct dm_border_t { uint mask; float4 k[32]; };
static inline __attribute__((always_inline)) float4 dm_bmix(float4 r, float4 w, float4 k) { return r + (w - r) * k; }
static inline __attribute__((always_inline)) float dm_bmix(float r, float w, float4 k) { return r + (w - r) * k.x; }
template<typename V, typename T, typename... A> static inline __attribute__((always_inline)) V dm_bs(V r, constant dm_border_t* b, uint i, T t, sampler w, A... a)
{
    if (b->mask >> i & 1u) r = dm_bmix(r, t.sample(w, a...), b->k[i]);
    return r;
}

template <typename T>
static inline depth2d<T> spvDepthCast(texture2d<T> t)
{
    return reinterpret_cast<thread const depth2d<T> &>(t);
}

template <typename T>
static inline depth2d_array<T> spvDepthCast(texture2d_array<T> t)
{
    return reinterpret_cast<thread const depth2d_array<T> &>(t);
}

template <typename T>
static inline depthcube<T> spvDepthCast(texturecube<T> t)
{
    return reinterpret_cast<thread const depthcube<T> &>(t);
}

template <typename T>
static inline depthcube_array<T> spvDepthCast(texturecube_array<T> t)
{
    return reinterpret_cast<thread const depthcube_array<T> &>(t);
}

struct _10
{
    uint _m0;
    uint _m1[8];
    float4 _m2;
    float4 _m3;
    int _m4;
    float _m5[73];
    int4 _m6;
    int _m7;
};

struct _16
{
    float4 _m0[4096];
};

struct spvDescriptorSetBuffer0
{
    constant _16* fp_c1 [[id(0)]];
    constant _16* fp_c3 [[id(1)]];
    texture2d<float> fp_t_tcb_8 [[id(2)]];
    sampler fp_t_tcb_8Smplr [[id(3)]];
    texture2d_array<float> fp_t_tcb_A [[id(4)]];
    sampler fp_t_tcb_ASmplr [[id(5)]];
    texture2d_array<float> fp_t_tcb_C [[id(6)]];
    sampler fp_t_tcb_CSmplr [[id(7)]];
    texture2d_array<float> fp_t_tcb_E [[id(8)]];
    sampler fp_t_tcb_ESmplr [[id(9)]];
    sampler fp_t_tcb_8Smplr_w [[id(10)]];
    constant dm_border_t* dm_border [[id(11)]];
};

struct main0_out
{
    float4 m_47 [[color(0)]];
};

struct main0_in
{
    float4 m_40 [[user(locn0), center_no_perspective]];
    float4 m_44 [[user(locn1), center_no_perspective]];
    float4 m_42 [[user(locn2), center_no_perspective]];
    float4 m_38 [[user(locn3), center_no_perspective]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    bool _270 = false;
    bool _268 = false;
    float _54 = in.m_38.x;
    float _56 = in.m_38.y;
    float2 _929 = float2(_54, _56);
    float3 _60 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_929, float2(0.0), isnan(_929)), int2(0), component::x).xyw;
    float _62 = _60.x;
    float _64 = _60.y;
    float _66 = _60.z;
    float2 _946 = float2(_54, _56);
    float _68 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_946, float2(0.0), isnan(_946))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_946, float2(0.0), isnan(_946))).x;
    float _70 = in.m_40.y;
    float _72 = in.m_40.x;
    float _74 = in.m_42.y;
    float _76 = in.m_44.y;
    float _78 = in.m_42.x;
    float _80 = in.m_44.x;
    float _82 = -_62;
    float _84 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _86 = fma(_82, (*spvDescriptorSet0.fp_c3)._m0[46].z, _84);
    float _88 = -_64;
    float _90 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _92 = fma(_88, (*spvDescriptorSet0.fp_c3)._m0[46].z, _90);
    float _94 = -_66;
    float _96 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _98 = fma(_94, (*spvDescriptorSet0.fp_c3)._m0[46].z, _96);
    float _100 = _70 * _86;
    float _102 = _72 * _86;
    float _104 = -_68;
    float _106 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _108 = fma(_104, (*spvDescriptorSet0.fp_c3)._m0[46].z, _106);
    float _110 = -_100;
    float _112 = fma(_92, _74, _110);
    float _114 = -_100;
    float _116 = fma(_98, _76, _114);
    float _118 = -_102;
    float _120 = fma(_92, _78, _118);
    float _122 = -_102;
    float _124 = fma(_98, _80, _122);
    float _126 = _112 * _112;
    float _128 = _116 * _116;
    float _130 = -_86;
    float _132 = _130 + _92;
    float _134 = -_86;
    float _136 = _134 + _98;
    float _138 = fma(_120, _120, _126);
    float _140 = fma(_124, _124, _128);
    float _142 = -_108;
    bool _146 = _142 > (*spvDescriptorSet0.fp_c3)._m0[40].x;
    float _148 = _108 * _72;
    float _150 = fma(_132, _132, _138);
    float _152 = fma(_136, _136, _140);
    float _154 = -_108;
    bool _156 = _154 > (*spvDescriptorSet0.fp_c3)._m0[39].x;
    float _158 = _108 * _70;
    float _160 = rsqrt(_150);
    float _162 = rsqrt(_152);
    float _164 = _120 * _160;
    float _166 = _132 * _160;
    float _168 = _112 * _160;
    float _170 = _136 * _162;
    float _172 = _116 * _162;
    float _174 = _124 * _162;
    bool _176 = !_146;
    uint _179 = uint(_176 ? 0 : 1);
    float _181 = _164 * _170;
    float _183 = _166 * _172;
    float _185 = -_181;
    float _187 = fma(_166, _174, _185);
    float _189 = _168 * _174;
    float _191 = -_183;
    float _193 = fma(_168, _170, _191);
    float _195 = _187 * _187;
    float _197 = -_189;
    float _199 = fma(_164, _172, _197);
    float _201 = fma(_193, _193, _195);
    uint _203 = 2u;
    if (!_146)
    {
        _203 = 1u;
    }
    uint _205 = _203;
    uint _207 = _205;
    if (!_156)
    {
        _207 = _179;
    }
    uint _209 = _207;
    float _211 = fma(_199, _199, _201);
    uint _213 = min(_209, 2u);
    float _215 = rsqrt(_211);
    int _218 = int(_213) << 2;
    float _220 = _187 * _215;
    float _222 = _193 * _215;
    float _224 = _199 * _215;
    float _226 = _220 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    uint _228 = uint(int(uint(_218) >> uint(2)));
    uint _230 = uint(int(uint(int(_228)) >> uint(2)));
    int _232 = int(_228) & 3;
    float _234 = (*spvDescriptorSet0.fp_c1)._m0[int(_230)][_232];
    float _236 = fma(_222, (*spvDescriptorSet0.fp_c3)._m0[35].x, _226);
    float _238 = fma(_224, (*spvDescriptorSet0.fp_c3)._m0[35].z, _236);
    float _240 = abs(_238);
    float _242 = -_240;
    float _244 = _242 + 1.0;
    float _246 = precise::clamp(_244, 0.0, 1.0);
    float _248 = abs(_246);
    float _250 = log2(_248);
    float _252 = _250 * (*spvDescriptorSet0.fp_c3)._m0[48].z;
    float _254 = exp2(_252);
    float _256 = _254 * (*spvDescriptorSet0.fp_c3)._m0[48].y;
    float _258 = fma(_222, _256, _148);
    float _260 = fma(_220, _256, _158);
    float _262 = fma(_224, _256, _108);
    bool _264 = as_type<int>(_234) == 1200;
    if (!_264)
    {
        bool _266 = as_type<int>(_234) == 1472;
        _268 = _266;
        if (!_268)
        {
            _270 = true;
        }
    }
    float _304;
    float _306;
    float _308;
    float _310;
    if (!_268)
    {
        if (!_270)
        {
            float _272 = _260 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
            float _274 = _260 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
            float _276 = _260 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _278 = _260 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
            float _280 = fma(_258, (*spvDescriptorSet0.fp_c3)._m0[0].x, _272);
            float _282 = fma(_258, (*spvDescriptorSet0.fp_c3)._m0[1].x, _274);
            float _284 = fma(_258, (*spvDescriptorSet0.fp_c3)._m0[2].x, _276);
            float _286 = fma(_258, (*spvDescriptorSet0.fp_c3)._m0[3].x, _278);
            float _288 = fma(_262, (*spvDescriptorSet0.fp_c3)._m0[0].z, _280);
            float _290 = fma(_262, (*spvDescriptorSet0.fp_c3)._m0[1].z, _282);
            float _292 = fma(_262, (*spvDescriptorSet0.fp_c3)._m0[2].z, _284);
            float _294 = fma(_262, (*spvDescriptorSet0.fp_c3)._m0[3].z, _286);
            float _296 = _288 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
            float _298 = _290 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
            float _300 = _292 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
            float _302 = _294 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
            _304 = _302;
            _306 = _298;
            _308 = _300;
            _310 = _296;
        }
    }
    if ((false || _270) || _268)
    {
        if ((!_270) || _268)
        {
            _268 = false;
            float _312 = _260 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
            float _314 = _260 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
            float _316 = _260 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
            float _318 = _260 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
            float _320 = fma(_258, (*spvDescriptorSet0.fp_c3)._m0[4].x, _312);
            float _322 = fma(_258, (*spvDescriptorSet0.fp_c3)._m0[5].x, _314);
            float _324 = fma(_258, (*spvDescriptorSet0.fp_c3)._m0[6].x, _316);
            float _326 = fma(_258, (*spvDescriptorSet0.fp_c3)._m0[7].x, _318);
            float _328 = fma(_262, (*spvDescriptorSet0.fp_c3)._m0[4].z, _320);
            float _330 = fma(_262, (*spvDescriptorSet0.fp_c3)._m0[5].z, _322);
            float _332 = fma(_262, (*spvDescriptorSet0.fp_c3)._m0[6].z, _324);
            float _334 = fma(_262, (*spvDescriptorSet0.fp_c3)._m0[7].z, _326);
            float _336 = _328 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
            float _338 = _330 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
            float _340 = _332 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
            float _342 = _334 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
            _304 = _342;
            _306 = _338;
            _308 = _340;
            _310 = _336;
        }
        if (false || _270)
        {
            _270 = false;
            float _344 = _260 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
            float _346 = _260 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
            float _348 = _260 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
            float _350 = _260 * (*spvDescriptorSet0.fp_c3)._m0[11].y;
            float _352 = fma(_258, (*spvDescriptorSet0.fp_c3)._m0[8].x, _344);
            float _354 = fma(_258, (*spvDescriptorSet0.fp_c3)._m0[9].x, _346);
            float _356 = fma(_258, (*spvDescriptorSet0.fp_c3)._m0[10].x, _348);
            float _358 = fma(_258, (*spvDescriptorSet0.fp_c3)._m0[11].x, _350);
            float _360 = fma(_262, (*spvDescriptorSet0.fp_c3)._m0[8].z, _352);
            float _362 = fma(_262, (*spvDescriptorSet0.fp_c3)._m0[9].z, _354);
            float _364 = fma(_262, (*spvDescriptorSet0.fp_c3)._m0[10].z, _356);
            float _366 = fma(_262, (*spvDescriptorSet0.fp_c3)._m0[11].z, _358);
            float _368 = _360 + (*spvDescriptorSet0.fp_c3)._m0[8].w;
            float _370 = _362 + (*spvDescriptorSet0.fp_c3)._m0[9].w;
            float _372 = _364 + (*spvDescriptorSet0.fp_c3)._m0[10].w;
            float _374 = _366 + (*spvDescriptorSet0.fp_c3)._m0[11].w;
            _304 = _374;
            _306 = _370;
            _308 = _372;
            _310 = _368;
        }
    }
    float _376 = _304;
    float _378 = _306;
    float _380 = _308;
    float _382 = _310;
    float _384 = float(int(_209));
    float _386 = 1.0 / _376;
    float _388 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _390 = rint(_384);
    float _392 = precise::max(_390, 0.0);
    uint _394 = uint(_392);
    uint _396 = clamp(_394, 0u, 65535u);
    float _398 = _386 * _378;
    float _400 = _386 * _380;
    float _402 = precise::clamp(_400, 0.0, 1.0);
    float _404 = _386 * _382;
    float _406 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _408 = fma(_402, _388, _398);
    float _410 = fma(_402, _406, _404);
    float _412 = -_406;
    float _414 = fma(_402, _412, _404);
    float3 _1591 = float3(_404, _408, float(int(_396)));
    float3 _1595 = select(_1591, float3(0.0), isnan(_1591));
    float _416 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1595.xy, uint(rint(_1595.z)), _402);
    float3 _1604 = float3(_410, _408, float(int(_396)));
    float3 _1606 = select(_1604, float3(0.0), isnan(_1604));
    float _418 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1606.xy, uint(rint(_1606.z)), _402);
    float3 _1615 = float3(_414, _408, float(int(_396)));
    float3 _1617 = select(_1615, float3(0.0), isnan(_1615));
    float _420 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1617.xy, uint(rint(_1617.z)), _402);
    float _422 = -_388;
    float _424 = fma(_402, _422, _398);
    float3 _1632 = float3(_410, _398, float(int(_396)));
    float3 _1634 = select(_1632, float3(0.0), isnan(_1632));
    float _426 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1634.xy, uint(rint(_1634.z)), _402);
    float3 _1643 = float3(_404, _398, float(int(_396)));
    float3 _1645 = select(_1643, float3(0.0), isnan(_1643));
    float _428 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1645.xy, uint(rint(_1645.z)), _402);
    float3 _1654 = float3(_414, _398, float(int(_396)));
    float3 _1656 = select(_1654, float3(0.0), isnan(_1654));
    float _430 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1656.xy, uint(rint(_1656.z)), _402);
    float3 _1665 = float3(_410, _424, float(int(_396)));
    float3 _1667 = select(_1665, float3(0.0), isnan(_1665));
    float _432 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1667.xy, uint(rint(_1667.z)), _402);
    float _434 = -_158;
    float _436 = _434 + (*spvDescriptorSet0.fp_c3)._m0[42].y;
    float _438 = -_148;
    float _440 = _438 + (*spvDescriptorSet0.fp_c3)._m0[42].x;
    float _442 = _158 * (*spvDescriptorSet0.fp_c3)._m0[22].y;
    float _444 = _436 * _436;
    float _446 = fma(_440, _440, _444);
    float _448 = -_108;
    float _450 = _448 + (*spvDescriptorSet0.fp_c3)._m0[42].z;
    float _452 = fma(_450, _450, _446);
    float _454 = sqrt(_452);
    float _456 = _158 * (*spvDescriptorSet0.fp_c3)._m0[24].y;
    bool _458 = _454 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    bool _460 = _454 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    bool _462 = !_458;
    int _464 = _462 ? 0 : 1;
    int _466 = 2;
    if (!_458)
    {
        _466 = 1;
    }
    int _468 = _466;
    int _470 = _468;
    if (!_460)
    {
        _470 = _464;
    }
    int _472 = _470;
    float _474 = _158 * (*spvDescriptorSet0.fp_c3)._m0[21].y;
    float _476 = _158 * (*spvDescriptorSet0.fp_c3)._m0[19].y;
    float _478 = fma(_148, (*spvDescriptorSet0.fp_c3)._m0[22].x, _442);
    float _480 = float(_472);
    float _482 = fma(_148, (*spvDescriptorSet0.fp_c3)._m0[21].x, _474);
    float _484 = fma(_148, (*spvDescriptorSet0.fp_c3)._m0[19].x, _476);
    float _486 = _158 * (*spvDescriptorSet0.fp_c3)._m0[20].y;
    float _488 = precise::min(_480, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _490 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[21].z, _482);
    float _492 = fma(_148, (*spvDescriptorSet0.fp_c3)._m0[24].x, _456);
    float _494 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[19].z, _484);
    bool _496 = _488 != 1.0;
    bool _498 = isnan(_488);
    bool _500 = _496 || _498;
    bool _502 = isnan(1.0);
    bool _504 = _500 || _502;
    float _506 = _158 * (*spvDescriptorSet0.fp_c3)._m0[23].y;
    float _508 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[22].z, _478);
    float _510 = _490 + (*spvDescriptorSet0.fp_c3)._m0[21].w;
    float _512 = fma(_148, (*spvDescriptorSet0.fp_c3)._m0[20].x, _486);
    float _514 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[24].z, _492);
    float _516 = _494 + (*spvDescriptorSet0.fp_c3)._m0[19].w;
    bool _518 = _488 != 0.0;
    bool _520 = isnan(_488);
    bool _522 = _518 || _520;
    bool _524 = isnan(0.0);
    bool _526 = _522 || _524;
    float _528 = fma(_148, (*spvDescriptorSet0.fp_c3)._m0[23].x, _506);
    float _530 = _158 * (*spvDescriptorSet0.fp_c3)._m0[18].y;
    float _532 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[20].z, _512);
    float _534 = _158 * (*spvDescriptorSet0.fp_c3)._m0[17].y;
    float _536 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[23].z, _528);
    float _538 = _510;
    float _540 = _516;
    if (_504)
    {
        float _542 = _514 + (*spvDescriptorSet0.fp_c3)._m0[24].w;
        _538 = _542;
    }
    float _544 = _538;
    float _546 = _544;
    if (_504)
    {
        float _548 = _508 + (*spvDescriptorSet0.fp_c3)._m0[22].w;
        _540 = _548;
    }
    float _550 = _540;
    float _552 = fma(_148, (*spvDescriptorSet0.fp_c3)._m0[18].x, _530);
    float _554 = rint(_488);
    float _556 = precise::max(_554, 0.0);
    uint _558 = uint(_556);
    uint _560 = clamp(_558, 0u, 65535u);
    float _562 = _158 * (*spvDescriptorSet0.fp_c3)._m0[16].y;
    float _564 = _532 + (*spvDescriptorSet0.fp_c3)._m0[20].w;
    float _566 = _564;
    float _568 = _550;
    if (_504)
    {
        float _570 = _536 + (*spvDescriptorSet0.fp_c3)._m0[23].w;
        _566 = _570;
    }
    float _572 = _566;
    float _574 = fma(_148, (*spvDescriptorSet0.fp_c3)._m0[17].x, _534);
    float _576 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[18].z, _552);
    float _578 = fma(_148, (*spvDescriptorSet0.fp_c3)._m0[16].x, _562);
    float _580 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].z;
    float _582 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[17].z, _574);
    float _584 = _572;
    if (!_526)
    {
        float _586 = _576 + (*spvDescriptorSet0.fp_c3)._m0[18].w;
        _546 = _586;
    }
    float _588 = _546;
    float _590 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[16].z, _578);
    float _592 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].w;
    if (!_526)
    {
        float _594 = _582 + (*spvDescriptorSet0.fp_c3)._m0[17].w;
        _584 = _594;
    }
    float _596 = _584;
    float _598 = 0.0 + _588;
    float _600 = precise::clamp(_598, 0.0, 1.0);
    if (!_526)
    {
        float _602 = _590 + (*spvDescriptorSet0.fp_c3)._m0[16].w;
        _568 = _602;
    }
    float _604 = _568;
    float _606 = fma(_600, _592, _596);
    float _608 = -_580;
    float _610 = fma(_600, _608, _604);
    float _612 = fma(_600, _580, _604);
    float _614 = _418 + _416;
    float3 _2011 = float3(_404, _424, float(int(_396)));
    float3 _2013 = select(_2011, float3(0.0), isnan(_2011));
    float _616 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _2013.xy, uint(rint(_2013.z)), _402);
    float3 _2022 = float3(_414, _424, float(int(_396)));
    float3 _2024 = select(_2022, float3(0.0), isnan(_2022));
    float _618 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _2024.xy, uint(rint(_2024.z)), _402);
    float3 _2033 = float3(_604, _606, float(int(_560)));
    float3 _2035 = select(_2033, float3(0.0), isnan(_2033));
    float _620 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2035.xy, uint(rint(_2035.z)), _600);
    float _622 = _614 + _420;
    float3 _2047 = float3(_610, _606, float(int(_560)));
    float3 _2049 = select(_2047, float3(0.0), isnan(_2047));
    float _624 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2049.xy, uint(rint(_2049.z)), _600);
    float3 _2058 = float3(_612, _596, float(int(_560)));
    float3 _2060 = select(_2058, float3(0.0), isnan(_2058));
    float _626 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2060.xy, uint(rint(_2060.z)), _600);
    float3 _2069 = float3(_612, _606, float(int(_560)));
    float3 _2071 = select(_2069, float3(0.0), isnan(_2069));
    float _628 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2071.xy, uint(rint(_2071.z)), _600);
    float _630 = _622 + _426;
    float _632 = -_592;
    float _634 = fma(_600, _632, _596);
    float _636 = _630 + _428;
    float _638 = _636 + _430;
    float _640 = _638 + _432;
    float3 _2098 = float3(_604, _596, float(int(_560)));
    float3 _2100 = select(_2098, float3(0.0), isnan(_2098));
    float _642 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2100.xy, uint(rint(_2100.z)), _600);
    float3 _2109 = float3(_610, _596, float(int(_560)));
    float3 _2111 = select(_2109, float3(0.0), isnan(_2109));
    float _644 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2111.xy, uint(rint(_2111.z)), _600);
    float3 _2120 = float3(_612, _634, float(int(_560)));
    float3 _2122 = select(_2120, float3(0.0), isnan(_2120));
    float _646 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2122.xy, uint(rint(_2122.z)), _600);
    float3 _2131 = float3(_604, _634, float(int(_560)));
    float3 _2133 = select(_2131, float3(0.0), isnan(_2131));
    float _648 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2133.xy, uint(rint(_2133.z)), _600);
    float _650 = _158 * (*spvDescriptorSet0.fp_c3)._m0[25].y;
    float _652 = _158 * (*spvDescriptorSet0.fp_c3)._m0[26].y;
    float _654 = _158 * (*spvDescriptorSet0.fp_c3)._m0[27].y;
    float _656 = _158 * (*spvDescriptorSet0.fp_c3)._m0[33].y;
    float _658 = _158 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    float _660 = _158 * (*spvDescriptorSet0.fp_c3)._m0[29].y;
    float _662 = _158 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _664 = _158 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    float _666 = _158 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _668 = -_158;
    float _670 = _668 + (*spvDescriptorSet0.fp_c3)._m0[43].y;
    float _672 = fma(_148, (*spvDescriptorSet0.fp_c3)._m0[27].x, _654);
    float _674 = -_148;
    float _676 = _674 + (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _678 = fma(_148, (*spvDescriptorSet0.fp_c3)._m0[25].x, _650);
    float _680 = _670 * _670;
    float _682 = fma(_148, (*spvDescriptorSet0.fp_c3)._m0[26].x, _652);
    float _684 = fma(_148, (*spvDescriptorSet0.fp_c3)._m0[28].x, _666);
    float _686 = fma(_148, (*spvDescriptorSet0.fp_c3)._m0[29].x, _660);
    float _688 = fma(_148, (*spvDescriptorSet0.fp_c3)._m0[30].x, _658);
    float _690 = fma(_148, (*spvDescriptorSet0.fp_c3)._m0[31].x, _662);
    float _692 = fma(_148, (*spvDescriptorSet0.fp_c3)._m0[32].x, _664);
    float _694 = fma(_148, (*spvDescriptorSet0.fp_c3)._m0[33].x, _656);
    float _696 = fma(_676, _676, _680);
    float _698 = -_108;
    float _700 = _698 + (*spvDescriptorSet0.fp_c3)._m0[43].z;
    float _702 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[28].z, _684);
    float _704 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[29].z, _686);
    float _706 = fma(_700, _700, _696);
    float _708 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[30].z, _688);
    float _710 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[31].z, _690);
    float _712 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[32].z, _692);
    float _714 = _704 + (*spvDescriptorSet0.fp_c3)._m0[29].w;
    float _716 = _708 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _718 = sqrt(_706);
    float _720 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[27].z, _672);
    float _722 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[26].z, _682);
    float _724 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[25].z, _678);
    bool _726 = _718 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    bool _728 = _718 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    bool _730 = !_726;
    int _732 = _730 ? 0 : 1;
    int _734 = 2;
    float _736 = _714;
    float _738 = _716;
    if (!_726)
    {
        _734 = 1;
    }
    int _740 = _734;
    int _742 = _740;
    if (!_728)
    {
        _742 = _732;
    }
    int _744 = _742;
    float _746 = float(_744);
    float _748 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[33].z, _694);
    float _750 = _702 + (*spvDescriptorSet0.fp_c3)._m0[28].w;
    float _752 = precise::min(_746, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    bool _754 = _752 != 1.0;
    bool _756 = isnan(_752);
    bool _758 = _754 || _756;
    bool _760 = isnan(1.0);
    bool _762 = _758 || _760;
    float _764 = _750;
    if (_762)
    {
        float _766 = _710 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
        _764 = _766;
    }
    float _768 = _764;
    float _770 = _768;
    if (_762)
    {
        float _772 = _712 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
        _736 = _772;
    }
    float _774 = _736;
    float _776 = _774;
    if (_762)
    {
        float _778 = _748 + (*spvDescriptorSet0.fp_c3)._m0[33].w;
        _738 = _778;
    }
    float _780 = _738;
    bool _782 = _752 != 0.0;
    bool _784 = isnan(_752);
    bool _786 = _782 || _784;
    bool _788 = isnan(0.0);
    bool _790 = _786 || _788;
    float _792 = rint(_752);
    float _794 = precise::max(_792, 0.0);
    uint _796 = uint(_794);
    uint _798 = clamp(_796, 0u, 65535u);
    float _800 = _780;
    if (!_790)
    {
        float _802 = _720 + (*spvDescriptorSet0.fp_c3)._m0[27].w;
        _800 = _802;
    }
    float _804 = _800;
    if (!_790)
    {
        float _806 = _722 + (*spvDescriptorSet0.fp_c3)._m0[26].w;
        _776 = _806;
    }
    float _808 = _776;
    if (!_790)
    {
        float _810 = _724 + (*spvDescriptorSet0.fp_c3)._m0[25].w;
        _770 = _810;
    }
    float _812 = _770;
    float _814 = 0.0 + _804;
    float _816 = precise::clamp(_814, 0.0, 1.0);
    float _818 = fma(_592, _816, _808);
    float _820 = fma(_580, _816, _812);
    float3 _2456 = float3(_610, _634, float(int(_560)));
    float3 _2458 = select(_2456, float3(0.0), isnan(_2456));
    float _822 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2458.xy, uint(rint(_2458.z)), _600);
    float _824 = -_580;
    float _826 = fma(_824, _816, _812);
    float3 _2473 = float3(_812, _818, float(int(_798)));
    float3 _2475 = select(_2473, float3(0.0), isnan(_2473));
    float _828 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2475.xy, uint(rint(_2475.z)), _816);
    float3 _2484 = float3(_820, _818, float(int(_798)));
    float3 _2486 = select(_2484, float3(0.0), isnan(_2484));
    float _830 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2486.xy, uint(rint(_2486.z)), _816);
    float3 _2495 = float3(_826, _818, float(int(_798)));
    float3 _2497 = select(_2495, float3(0.0), isnan(_2495));
    float _832 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2497.xy, uint(rint(_2497.z)), _816);
    float3 _2506 = float3(_820, _808, float(int(_798)));
    float3 _2508 = select(_2506, float3(0.0), isnan(_2506));
    float _834 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2508.xy, uint(rint(_2508.z)), _816);
    float _836 = -_592;
    float _838 = fma(_836, _816, _808);
    float3 _2523 = float3(_812, _808, float(int(_798)));
    float3 _2525 = select(_2523, float3(0.0), isnan(_2523));
    float _840 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2525.xy, uint(rint(_2525.z)), _816);
    float3 _2534 = float3(_826, _808, float(int(_798)));
    float3 _2536 = select(_2534, float3(0.0), isnan(_2534));
    float _842 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2536.xy, uint(rint(_2536.z)), _816);
    float3 _2545 = float3(_820, _838, float(int(_798)));
    float3 _2547 = select(_2545, float3(0.0), isnan(_2545));
    float _844 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2547.xy, uint(rint(_2547.z)), _816);
    float3 _2556 = float3(_812, _838, float(int(_798)));
    float3 _2558 = select(_2556, float3(0.0), isnan(_2556));
    float _846 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2558.xy, uint(rint(_2558.z)), _816);
    float3 _2567 = float3(_826, _838, float(int(_798)));
    float3 _2569 = select(_2567, float3(0.0), isnan(_2567));
    float _848 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2569.xy, uint(rint(_2569.z)), _816);
    float _850 = _640 + _616;
    float _852 = _850 + _618;
    float _854 = -_108;
    float _856 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _858 = _854 + _856;
    float _860 = _628 + _620;
    float _862 = _858 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _864 = precise::clamp(_862, 0.0, 1.0);
    float _866 = _860 + _624;
    float _868 = fma(_852, 0.111111111938953399658203125, _864);
    float _870 = -_108;
    float _872 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _874 = _870 + _872;
    float _876 = _866 + _626;
    float _878 = _874 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _880 = precise::clamp(_878, 0.0, 1.0);
    float _882 = _876 + _642;
    float _884 = _882 + _644;
    float _886 = _884 + _646;
    float _888 = _886 + _648;
    float _890 = _888 + _822;
    float _892 = _830 + _828;
    float _894 = _890 * 0.111111111938953399658203125;
    float _896 = _892 + _832;
    float _898 = _896 + _834;
    float _900 = _898 + _840;
    float _902 = _900 + _842;
    float _904 = _902 + _844;
    float _906 = _904 + _846;
    float _908 = _906 + _848;
    float _910 = _908 * 0.111111111938953399658203125;
    float _912 = _910 * (*spvDescriptorSet0.fp_c3)._m0[49].w;
    float _914 = fma(_894, (*spvDescriptorSet0.fp_c3)._m0[49].z, _912);
    float _916 = _914 + _880;
    out.m_47.x = (*spvDescriptorSet0.fp_c3)._m0[34].x;
    out.m_47.y = _868;
    out.m_47.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_47.w = _916;
    return out;
}

