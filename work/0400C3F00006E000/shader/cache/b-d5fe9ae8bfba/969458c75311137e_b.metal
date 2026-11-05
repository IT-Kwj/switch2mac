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
    bool _280 = false;
    bool _278 = false;
    float _54 = in.m_38.x;
    float _56 = in.m_38.y;
    float2 _939 = float2(_54, _56);
    float3 _60 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_939, float2(0.0), isnan(_939)), int2(0), component::x).xyw;
    float _62 = _60.x;
    float _64 = _60.y;
    float _66 = _60.z;
    float2 _956 = float2(_54, _56);
    float _68 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_956, float2(0.0), isnan(_956))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_956, float2(0.0), isnan(_956))).x;
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
    float _104 = -_100;
    float _106 = fma(_92, _74, _104);
    float _108 = -_100;
    float _110 = fma(_98, _76, _108);
    float _112 = -_102;
    float _114 = fma(_92, _78, _112);
    float _116 = -_102;
    float _118 = fma(_98, _80, _116);
    float _120 = _106 * _106;
    float _122 = _110 * _110;
    float _124 = -_86;
    float _126 = _124 + _92;
    float _128 = -_86;
    float _130 = _128 + _98;
    float _132 = fma(_114, _114, _120);
    float _134 = fma(_118, _118, _122);
    float _136 = fma(_126, _126, _132);
    float _138 = fma(_130, _130, _134);
    float _140 = -_68;
    float _142 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _144 = fma(_140, (*spvDescriptorSet0.fp_c3)._m0[46].z, _142);
    float _146 = rsqrt(_136);
    float _148 = -_144;
    bool _152 = _148 > (*spvDescriptorSet0.fp_c3)._m0[40].x;
    float _154 = _144 * _72;
    float _156 = -_144;
    bool _158 = _156 > (*spvDescriptorSet0.fp_c3)._m0[39].x;
    float _160 = _144 * _70;
    float _162 = -_144;
    bool _164 = _162 > (*spvDescriptorSet0.fp_c3)._m0[41].x;
    float _166 = rsqrt(_138);
    float _168 = _114 * _146;
    float _170 = _126 * _146;
    float _172 = _106 * _146;
    float _174 = _130 * _166;
    float _176 = _110 * _166;
    float _178 = _118 * _166;
    float _180 = _168 * _174;
    float _182 = _170 * _176;
    int _185 = 2;
    if (!_152)
    {
        _185 = 1;
    }
    int _187 = _185;
    float _189 = -_180;
    float _191 = fma(_170, _178, _189);
    float _193 = _172 * _178;
    float _195 = -_182;
    float _197 = fma(_172, _174, _195);
    bool _199 = !_152;
    int _201 = _199 ? 0 : 1;
    float _203 = _191 * _191;
    float _205 = -_193;
    float _207 = fma(_168, _176, _205);
    int _209 = _187;
    if (!_158)
    {
        _209 = _201;
    }
    int _211 = _209;
    float _213 = fma(_197, _197, _203);
    int _215 = _211 + 1;
    float _217 = fma(_207, _207, _213);
    uint _220 = uint(_215);
    if (!_164)
    {
        _220 = uint(_211);
    }
    uint _222 = _220;
    uint _224 = min(_222, 2u);
    float _226 = rsqrt(_217);
    int _228 = int(_224) << 2;
    uint _230 = uint(int(uint(_228) >> uint(2)));
    uint _232 = uint(int(uint(int(_230)) >> uint(2)));
    int _234 = int(_230) & 3;
    float _236 = (*spvDescriptorSet0.fp_c1)._m0[int(_232)][_234];
    float _238 = _191 * _226;
    float _240 = _197 * _226;
    float _242 = _207 * _226;
    float _244 = _238 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    float _246 = fma(_240, (*spvDescriptorSet0.fp_c3)._m0[35].x, _244);
    float _248 = fma(_242, (*spvDescriptorSet0.fp_c3)._m0[35].z, _246);
    float _250 = abs(_248);
    float _252 = -_250;
    float _254 = _252 + 1.0;
    float _256 = precise::clamp(_254, 0.0, 1.0);
    float _258 = abs(_256);
    float _260 = log2(_258);
    float _262 = _260 * (*spvDescriptorSet0.fp_c3)._m0[48].z;
    float _264 = exp2(_262);
    float _266 = _264 * (*spvDescriptorSet0.fp_c3)._m0[48].y;
    float _268 = fma(_240, _266, _154);
    float _270 = fma(_238, _266, _160);
    float _272 = fma(_242, _266, _144);
    bool _274 = as_type<int>(_236) == 1264;
    if (!_274)
    {
        bool _276 = as_type<int>(_236) == 1536;
        _278 = _276;
        if (!_278)
        {
            _280 = true;
        }
    }
    float _314;
    float _316;
    float _318;
    float _320;
    if (!_278)
    {
        if (!_280)
        {
            float _282 = _270 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
            float _284 = _270 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
            float _286 = _270 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _288 = _270 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
            float _290 = fma(_268, (*spvDescriptorSet0.fp_c3)._m0[0].x, _282);
            float _292 = fma(_268, (*spvDescriptorSet0.fp_c3)._m0[1].x, _284);
            float _294 = fma(_268, (*spvDescriptorSet0.fp_c3)._m0[2].x, _286);
            float _296 = fma(_268, (*spvDescriptorSet0.fp_c3)._m0[3].x, _288);
            float _298 = fma(_272, (*spvDescriptorSet0.fp_c3)._m0[0].z, _290);
            float _300 = fma(_272, (*spvDescriptorSet0.fp_c3)._m0[1].z, _292);
            float _302 = fma(_272, (*spvDescriptorSet0.fp_c3)._m0[2].z, _294);
            float _304 = fma(_272, (*spvDescriptorSet0.fp_c3)._m0[3].z, _296);
            float _306 = _298 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
            float _308 = _300 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
            float _310 = _302 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
            float _312 = _304 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
            _314 = _312;
            _316 = _308;
            _318 = _310;
            _320 = _306;
        }
    }
    if ((false || _280) || _278)
    {
        if ((!_280) || _278)
        {
            _278 = false;
            float _322 = _270 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
            float _324 = _270 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
            float _326 = _270 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
            float _328 = _270 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
            float _330 = fma(_268, (*spvDescriptorSet0.fp_c3)._m0[4].x, _322);
            float _332 = fma(_268, (*spvDescriptorSet0.fp_c3)._m0[5].x, _324);
            float _334 = fma(_268, (*spvDescriptorSet0.fp_c3)._m0[6].x, _326);
            float _336 = fma(_268, (*spvDescriptorSet0.fp_c3)._m0[7].x, _328);
            float _338 = fma(_272, (*spvDescriptorSet0.fp_c3)._m0[4].z, _330);
            float _340 = fma(_272, (*spvDescriptorSet0.fp_c3)._m0[5].z, _332);
            float _342 = fma(_272, (*spvDescriptorSet0.fp_c3)._m0[6].z, _334);
            float _344 = fma(_272, (*spvDescriptorSet0.fp_c3)._m0[7].z, _336);
            float _346 = _338 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
            float _348 = _340 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
            float _350 = _342 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
            float _352 = _344 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
            _314 = _352;
            _316 = _348;
            _318 = _350;
            _320 = _346;
        }
        if (false || _280)
        {
            _280 = false;
            float _354 = _270 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
            float _356 = _270 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
            float _358 = _270 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
            float _360 = _270 * (*spvDescriptorSet0.fp_c3)._m0[11].y;
            float _362 = fma(_268, (*spvDescriptorSet0.fp_c3)._m0[8].x, _354);
            float _364 = fma(_268, (*spvDescriptorSet0.fp_c3)._m0[9].x, _356);
            float _366 = fma(_268, (*spvDescriptorSet0.fp_c3)._m0[10].x, _358);
            float _368 = fma(_268, (*spvDescriptorSet0.fp_c3)._m0[11].x, _360);
            float _370 = fma(_272, (*spvDescriptorSet0.fp_c3)._m0[8].z, _362);
            float _372 = fma(_272, (*spvDescriptorSet0.fp_c3)._m0[9].z, _364);
            float _374 = fma(_272, (*spvDescriptorSet0.fp_c3)._m0[10].z, _366);
            float _376 = fma(_272, (*spvDescriptorSet0.fp_c3)._m0[11].z, _368);
            float _378 = _370 + (*spvDescriptorSet0.fp_c3)._m0[8].w;
            float _380 = _372 + (*spvDescriptorSet0.fp_c3)._m0[9].w;
            float _382 = _374 + (*spvDescriptorSet0.fp_c3)._m0[10].w;
            float _384 = _376 + (*spvDescriptorSet0.fp_c3)._m0[11].w;
            _314 = _384;
            _316 = _380;
            _318 = _382;
            _320 = _378;
        }
    }
    float _386 = _314;
    float _388 = _316;
    float _390 = _318;
    float _392 = _320;
    float _394 = float(int(_222));
    float _396 = 1.0 / _386;
    float _398 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _400 = rint(_394);
    float _402 = precise::max(_400, 0.0);
    uint _404 = uint(_402);
    uint _406 = clamp(_404, 0u, 65535u);
    float _408 = _396 * _388;
    float _410 = _396 * _390;
    float _412 = precise::clamp(_410, 0.0, 1.0);
    float _414 = _396 * _392;
    float _416 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _418 = fma(_412, _398, _408);
    float _420 = fma(_412, _416, _414);
    float _422 = -_416;
    float _424 = fma(_412, _422, _414);
    float3 _1617 = float3(_414, _418, float(int(_406)));
    float3 _1621 = select(_1617, float3(0.0), isnan(_1617));
    float _426 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1621.xy, uint(rint(_1621.z)), _412);
    float3 _1630 = float3(_420, _418, float(int(_406)));
    float3 _1632 = select(_1630, float3(0.0), isnan(_1630));
    float _428 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1632.xy, uint(rint(_1632.z)), _412);
    float3 _1641 = float3(_424, _418, float(int(_406)));
    float3 _1643 = select(_1641, float3(0.0), isnan(_1641));
    float _430 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1643.xy, uint(rint(_1643.z)), _412);
    float _432 = -_398;
    float _434 = fma(_412, _432, _408);
    float3 _1658 = float3(_420, _408, float(int(_406)));
    float3 _1660 = select(_1658, float3(0.0), isnan(_1658));
    float _436 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1660.xy, uint(rint(_1660.z)), _412);
    float3 _1669 = float3(_414, _408, float(int(_406)));
    float3 _1671 = select(_1669, float3(0.0), isnan(_1669));
    float _438 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1671.xy, uint(rint(_1671.z)), _412);
    float3 _1680 = float3(_424, _408, float(int(_406)));
    float3 _1682 = select(_1680, float3(0.0), isnan(_1680));
    float _440 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1682.xy, uint(rint(_1682.z)), _412);
    float3 _1691 = float3(_420, _434, float(int(_406)));
    float3 _1693 = select(_1691, float3(0.0), isnan(_1691));
    float _442 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1693.xy, uint(rint(_1693.z)), _412);
    float _444 = -_160;
    float _446 = _444 + (*spvDescriptorSet0.fp_c3)._m0[42].y;
    float _448 = -_154;
    float _450 = _448 + (*spvDescriptorSet0.fp_c3)._m0[42].x;
    float _452 = _160 * (*spvDescriptorSet0.fp_c3)._m0[22].y;
    float _454 = _446 * _446;
    float _456 = fma(_450, _450, _454);
    float _458 = -_144;
    float _460 = _458 + (*spvDescriptorSet0.fp_c3)._m0[42].z;
    float _462 = fma(_460, _460, _456);
    float _464 = sqrt(_462);
    float _466 = _160 * (*spvDescriptorSet0.fp_c3)._m0[24].y;
    bool _468 = _464 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    bool _470 = _464 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    bool _472 = !_468;
    int _474 = _472 ? 0 : 1;
    int _476 = 2;
    if (!_468)
    {
        _476 = 1;
    }
    int _478 = _476;
    int _480 = _478;
    if (!_470)
    {
        _480 = _474;
    }
    int _482 = _480;
    float _484 = _160 * (*spvDescriptorSet0.fp_c3)._m0[21].y;
    float _486 = _160 * (*spvDescriptorSet0.fp_c3)._m0[19].y;
    float _488 = fma(_154, (*spvDescriptorSet0.fp_c3)._m0[22].x, _452);
    float _490 = float(_482);
    float _492 = fma(_154, (*spvDescriptorSet0.fp_c3)._m0[21].x, _484);
    float _494 = fma(_154, (*spvDescriptorSet0.fp_c3)._m0[19].x, _486);
    float _496 = _160 * (*spvDescriptorSet0.fp_c3)._m0[20].y;
    float _498 = precise::min(_490, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _500 = fma(_144, (*spvDescriptorSet0.fp_c3)._m0[21].z, _492);
    float _502 = fma(_154, (*spvDescriptorSet0.fp_c3)._m0[24].x, _466);
    float _504 = fma(_144, (*spvDescriptorSet0.fp_c3)._m0[19].z, _494);
    bool _506 = _498 != 1.0;
    bool _508 = isnan(_498);
    bool _510 = _506 || _508;
    bool _512 = isnan(1.0);
    bool _514 = _510 || _512;
    float _516 = _160 * (*spvDescriptorSet0.fp_c3)._m0[23].y;
    float _518 = fma(_144, (*spvDescriptorSet0.fp_c3)._m0[22].z, _488);
    float _520 = _500 + (*spvDescriptorSet0.fp_c3)._m0[21].w;
    float _522 = fma(_154, (*spvDescriptorSet0.fp_c3)._m0[20].x, _496);
    float _524 = fma(_144, (*spvDescriptorSet0.fp_c3)._m0[24].z, _502);
    float _526 = _504 + (*spvDescriptorSet0.fp_c3)._m0[19].w;
    bool _528 = _498 != 0.0;
    bool _530 = isnan(_498);
    bool _532 = _528 || _530;
    bool _534 = isnan(0.0);
    bool _536 = _532 || _534;
    float _538 = fma(_154, (*spvDescriptorSet0.fp_c3)._m0[23].x, _516);
    float _540 = _160 * (*spvDescriptorSet0.fp_c3)._m0[18].y;
    float _542 = fma(_144, (*spvDescriptorSet0.fp_c3)._m0[20].z, _522);
    float _544 = _160 * (*spvDescriptorSet0.fp_c3)._m0[17].y;
    float _546 = fma(_144, (*spvDescriptorSet0.fp_c3)._m0[23].z, _538);
    float _548 = _520;
    float _550 = _526;
    if (_514)
    {
        float _552 = _524 + (*spvDescriptorSet0.fp_c3)._m0[24].w;
        _548 = _552;
    }
    float _554 = _548;
    float _556 = _554;
    if (_514)
    {
        float _558 = _518 + (*spvDescriptorSet0.fp_c3)._m0[22].w;
        _550 = _558;
    }
    float _560 = _550;
    float _562 = fma(_154, (*spvDescriptorSet0.fp_c3)._m0[18].x, _540);
    float _564 = rint(_498);
    float _566 = precise::max(_564, 0.0);
    uint _568 = uint(_566);
    uint _570 = clamp(_568, 0u, 65535u);
    float _572 = _160 * (*spvDescriptorSet0.fp_c3)._m0[16].y;
    float _574 = _542 + (*spvDescriptorSet0.fp_c3)._m0[20].w;
    float _576 = _574;
    float _578 = _560;
    if (_514)
    {
        float _580 = _546 + (*spvDescriptorSet0.fp_c3)._m0[23].w;
        _576 = _580;
    }
    float _582 = _576;
    float _584 = fma(_154, (*spvDescriptorSet0.fp_c3)._m0[17].x, _544);
    float _586 = fma(_144, (*spvDescriptorSet0.fp_c3)._m0[18].z, _562);
    float _588 = fma(_154, (*spvDescriptorSet0.fp_c3)._m0[16].x, _572);
    float _590 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].z;
    float _592 = fma(_144, (*spvDescriptorSet0.fp_c3)._m0[17].z, _584);
    float _594 = _582;
    if (!_536)
    {
        float _596 = _586 + (*spvDescriptorSet0.fp_c3)._m0[18].w;
        _556 = _596;
    }
    float _598 = _556;
    float _600 = fma(_144, (*spvDescriptorSet0.fp_c3)._m0[16].z, _588);
    float _602 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].w;
    if (!_536)
    {
        float _604 = _592 + (*spvDescriptorSet0.fp_c3)._m0[17].w;
        _594 = _604;
    }
    float _606 = _594;
    float _608 = 0.0 + _598;
    float _610 = precise::clamp(_608, 0.0, 1.0);
    if (!_536)
    {
        float _612 = _600 + (*spvDescriptorSet0.fp_c3)._m0[16].w;
        _578 = _612;
    }
    float _614 = _578;
    float _616 = fma(_610, _602, _606);
    float _618 = -_590;
    float _620 = fma(_610, _618, _614);
    float _622 = fma(_610, _590, _614);
    float _624 = _428 + _426;
    float3 _2037 = float3(_414, _434, float(int(_406)));
    float3 _2039 = select(_2037, float3(0.0), isnan(_2037));
    float _626 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _2039.xy, uint(rint(_2039.z)), _412);
    float3 _2048 = float3(_424, _434, float(int(_406)));
    float3 _2050 = select(_2048, float3(0.0), isnan(_2048));
    float _628 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _2050.xy, uint(rint(_2050.z)), _412);
    float3 _2059 = float3(_614, _616, float(int(_570)));
    float3 _2061 = select(_2059, float3(0.0), isnan(_2059));
    float _630 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2061.xy, uint(rint(_2061.z)), _610);
    float _632 = _624 + _430;
    float3 _2073 = float3(_620, _616, float(int(_570)));
    float3 _2075 = select(_2073, float3(0.0), isnan(_2073));
    float _634 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2075.xy, uint(rint(_2075.z)), _610);
    float3 _2084 = float3(_622, _606, float(int(_570)));
    float3 _2086 = select(_2084, float3(0.0), isnan(_2084));
    float _636 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2086.xy, uint(rint(_2086.z)), _610);
    float3 _2095 = float3(_622, _616, float(int(_570)));
    float3 _2097 = select(_2095, float3(0.0), isnan(_2095));
    float _638 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2097.xy, uint(rint(_2097.z)), _610);
    float _640 = _632 + _436;
    float _642 = -_602;
    float _644 = fma(_610, _642, _606);
    float _646 = _640 + _438;
    float _648 = _646 + _440;
    float _650 = _648 + _442;
    float3 _2124 = float3(_614, _606, float(int(_570)));
    float3 _2126 = select(_2124, float3(0.0), isnan(_2124));
    float _652 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2126.xy, uint(rint(_2126.z)), _610);
    float3 _2135 = float3(_620, _606, float(int(_570)));
    float3 _2137 = select(_2135, float3(0.0), isnan(_2135));
    float _654 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2137.xy, uint(rint(_2137.z)), _610);
    float3 _2146 = float3(_622, _644, float(int(_570)));
    float3 _2148 = select(_2146, float3(0.0), isnan(_2146));
    float _656 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2148.xy, uint(rint(_2148.z)), _610);
    float3 _2157 = float3(_614, _644, float(int(_570)));
    float3 _2159 = select(_2157, float3(0.0), isnan(_2157));
    float _658 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2159.xy, uint(rint(_2159.z)), _610);
    float _660 = _160 * (*spvDescriptorSet0.fp_c3)._m0[25].y;
    float _662 = _160 * (*spvDescriptorSet0.fp_c3)._m0[26].y;
    float _664 = _160 * (*spvDescriptorSet0.fp_c3)._m0[27].y;
    float _666 = _160 * (*spvDescriptorSet0.fp_c3)._m0[33].y;
    float _668 = _160 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    float _670 = _160 * (*spvDescriptorSet0.fp_c3)._m0[29].y;
    float _672 = _160 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _674 = _160 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    float _676 = _160 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _678 = -_160;
    float _680 = _678 + (*spvDescriptorSet0.fp_c3)._m0[43].y;
    float _682 = fma(_154, (*spvDescriptorSet0.fp_c3)._m0[27].x, _664);
    float _684 = -_154;
    float _686 = _684 + (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _688 = fma(_154, (*spvDescriptorSet0.fp_c3)._m0[25].x, _660);
    float _690 = _680 * _680;
    float _692 = fma(_154, (*spvDescriptorSet0.fp_c3)._m0[26].x, _662);
    float _694 = fma(_154, (*spvDescriptorSet0.fp_c3)._m0[28].x, _676);
    float _696 = fma(_154, (*spvDescriptorSet0.fp_c3)._m0[29].x, _670);
    float _698 = fma(_154, (*spvDescriptorSet0.fp_c3)._m0[30].x, _668);
    float _700 = fma(_154, (*spvDescriptorSet0.fp_c3)._m0[31].x, _672);
    float _702 = fma(_154, (*spvDescriptorSet0.fp_c3)._m0[32].x, _674);
    float _704 = fma(_154, (*spvDescriptorSet0.fp_c3)._m0[33].x, _666);
    float _706 = fma(_686, _686, _690);
    float _708 = -_144;
    float _710 = _708 + (*spvDescriptorSet0.fp_c3)._m0[43].z;
    float _712 = fma(_144, (*spvDescriptorSet0.fp_c3)._m0[28].z, _694);
    float _714 = fma(_144, (*spvDescriptorSet0.fp_c3)._m0[29].z, _696);
    float _716 = fma(_710, _710, _706);
    float _718 = fma(_144, (*spvDescriptorSet0.fp_c3)._m0[30].z, _698);
    float _720 = fma(_144, (*spvDescriptorSet0.fp_c3)._m0[31].z, _700);
    float _722 = fma(_144, (*spvDescriptorSet0.fp_c3)._m0[32].z, _702);
    float _724 = _714 + (*spvDescriptorSet0.fp_c3)._m0[29].w;
    float _726 = _718 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _728 = sqrt(_716);
    float _730 = fma(_144, (*spvDescriptorSet0.fp_c3)._m0[27].z, _682);
    float _732 = fma(_144, (*spvDescriptorSet0.fp_c3)._m0[26].z, _692);
    float _734 = fma(_144, (*spvDescriptorSet0.fp_c3)._m0[25].z, _688);
    bool _736 = _728 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    bool _738 = _728 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    bool _740 = !_736;
    int _742 = _740 ? 0 : 1;
    int _744 = 2;
    float _746 = _724;
    float _748 = _726;
    if (!_736)
    {
        _744 = 1;
    }
    int _750 = _744;
    int _752 = _750;
    if (!_738)
    {
        _752 = _742;
    }
    int _754 = _752;
    float _756 = float(_754);
    float _758 = fma(_144, (*spvDescriptorSet0.fp_c3)._m0[33].z, _704);
    float _760 = _712 + (*spvDescriptorSet0.fp_c3)._m0[28].w;
    float _762 = precise::min(_756, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    bool _764 = _762 != 1.0;
    bool _766 = isnan(_762);
    bool _768 = _764 || _766;
    bool _770 = isnan(1.0);
    bool _772 = _768 || _770;
    float _774 = _760;
    if (_772)
    {
        float _776 = _720 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
        _774 = _776;
    }
    float _778 = _774;
    float _780 = _778;
    if (_772)
    {
        float _782 = _722 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
        _746 = _782;
    }
    float _784 = _746;
    float _786 = _784;
    if (_772)
    {
        float _788 = _758 + (*spvDescriptorSet0.fp_c3)._m0[33].w;
        _748 = _788;
    }
    float _790 = _748;
    bool _792 = _762 != 0.0;
    bool _794 = isnan(_762);
    bool _796 = _792 || _794;
    bool _798 = isnan(0.0);
    bool _800 = _796 || _798;
    float _802 = rint(_762);
    float _804 = precise::max(_802, 0.0);
    uint _806 = uint(_804);
    uint _808 = clamp(_806, 0u, 65535u);
    float _810 = _790;
    if (!_800)
    {
        float _812 = _730 + (*spvDescriptorSet0.fp_c3)._m0[27].w;
        _810 = _812;
    }
    float _814 = _810;
    if (!_800)
    {
        float _816 = _732 + (*spvDescriptorSet0.fp_c3)._m0[26].w;
        _786 = _816;
    }
    float _818 = _786;
    if (!_800)
    {
        float _820 = _734 + (*spvDescriptorSet0.fp_c3)._m0[25].w;
        _780 = _820;
    }
    float _822 = _780;
    float _824 = 0.0 + _814;
    float _826 = precise::clamp(_824, 0.0, 1.0);
    float _828 = fma(_602, _826, _818);
    float _830 = fma(_590, _826, _822);
    float3 _2482 = float3(_620, _644, float(int(_570)));
    float3 _2484 = select(_2482, float3(0.0), isnan(_2482));
    float _832 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2484.xy, uint(rint(_2484.z)), _610);
    float _834 = -_590;
    float _836 = fma(_834, _826, _822);
    float3 _2499 = float3(_822, _828, float(int(_808)));
    float3 _2501 = select(_2499, float3(0.0), isnan(_2499));
    float _838 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2501.xy, uint(rint(_2501.z)), _826);
    float3 _2510 = float3(_830, _828, float(int(_808)));
    float3 _2512 = select(_2510, float3(0.0), isnan(_2510));
    float _840 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2512.xy, uint(rint(_2512.z)), _826);
    float3 _2521 = float3(_836, _828, float(int(_808)));
    float3 _2523 = select(_2521, float3(0.0), isnan(_2521));
    float _842 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2523.xy, uint(rint(_2523.z)), _826);
    float3 _2532 = float3(_830, _818, float(int(_808)));
    float3 _2534 = select(_2532, float3(0.0), isnan(_2532));
    float _844 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2534.xy, uint(rint(_2534.z)), _826);
    float _846 = -_602;
    float _848 = fma(_846, _826, _818);
    float3 _2549 = float3(_822, _818, float(int(_808)));
    float3 _2551 = select(_2549, float3(0.0), isnan(_2549));
    float _850 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2551.xy, uint(rint(_2551.z)), _826);
    float3 _2560 = float3(_836, _818, float(int(_808)));
    float3 _2562 = select(_2560, float3(0.0), isnan(_2560));
    float _852 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2562.xy, uint(rint(_2562.z)), _826);
    float3 _2571 = float3(_830, _848, float(int(_808)));
    float3 _2573 = select(_2571, float3(0.0), isnan(_2571));
    float _854 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2573.xy, uint(rint(_2573.z)), _826);
    float3 _2582 = float3(_822, _848, float(int(_808)));
    float3 _2584 = select(_2582, float3(0.0), isnan(_2582));
    float _856 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2584.xy, uint(rint(_2584.z)), _826);
    float3 _2593 = float3(_836, _848, float(int(_808)));
    float3 _2595 = select(_2593, float3(0.0), isnan(_2593));
    float _858 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2595.xy, uint(rint(_2595.z)), _826);
    float _860 = _650 + _626;
    float _862 = _860 + _628;
    float _864 = -_144;
    float _866 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _868 = _864 + _866;
    float _870 = _638 + _630;
    float _872 = _868 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _874 = precise::clamp(_872, 0.0, 1.0);
    float _876 = _870 + _634;
    float _878 = fma(_862, 0.111111111938953399658203125, _874);
    float _880 = -_144;
    float _882 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _884 = _880 + _882;
    float _886 = _876 + _636;
    float _888 = _884 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _890 = precise::clamp(_888, 0.0, 1.0);
    float _892 = _886 + _652;
    float _894 = _892 + _654;
    float _896 = _894 + _656;
    float _898 = _896 + _658;
    float _900 = _898 + _832;
    float _902 = _840 + _838;
    float _904 = _900 * 0.111111111938953399658203125;
    float _906 = _902 + _842;
    float _908 = _906 + _844;
    float _910 = _908 + _850;
    float _912 = _910 + _852;
    float _914 = _912 + _854;
    float _916 = _914 + _856;
    float _918 = _916 + _858;
    float _920 = _918 * 0.111111111938953399658203125;
    float _922 = _920 * (*spvDescriptorSet0.fp_c3)._m0[49].w;
    float _924 = fma(_904, (*spvDescriptorSet0.fp_c3)._m0[49].z, _922);
    float _926 = _924 + _890;
    out.m_47.x = (*spvDescriptorSet0.fp_c3)._m0[34].x;
    out.m_47.y = _878;
    out.m_47.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_47.w = _926;
    return out;
}

