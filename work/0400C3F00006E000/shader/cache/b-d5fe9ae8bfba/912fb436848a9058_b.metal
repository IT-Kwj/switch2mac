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
    texture2d_array<float> fp_t_tcb_E [[id(4)]];
    sampler fp_t_tcb_ESmplr [[id(5)]];
    texture2d_array<float> fp_t_tcb_10 [[id(6)]];
    sampler fp_t_tcb_10Smplr [[id(7)]];
    texture2d<float> fp_t_tcb_C [[id(8)]];
    sampler fp_t_tcb_CSmplr [[id(9)]];
    texture2d_array<float> fp_t_tcb_12 [[id(10)]];
    sampler fp_t_tcb_12Smplr [[id(11)]];
    texture2d<float> fp_t_tcb_A [[id(12)]];
    sampler fp_t_tcb_ASmplr [[id(13)]];
    sampler fp_t_tcb_8Smplr_w [[id(14)]];
    sampler fp_t_tcb_CSmplr_w [[id(15)]];
    sampler fp_t_tcb_ASmplr_w [[id(16)]];
    constant dm_border_t* dm_border [[id(17)]];
};

struct main0_out
{
    float4 m_51 [[color(0)]];
};

struct main0_in
{
    float4 m_44 [[user(locn0), center_no_perspective]];
    float4 m_48 [[user(locn1), center_no_perspective]];
    float4 m_46 [[user(locn2), center_no_perspective]];
    float4 m_42 [[user(locn3), center_no_perspective]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    bool _284 = false;
    bool _282 = false;
    float _58 = in.m_42.x;
    float _60 = in.m_42.y;
    float2 _964 = float2(_58, _60);
    float3 _64 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_964, float2(0.0), isnan(_964)), int2(0), component::x).xyw;
    float _66 = _64.x;
    float _68 = _64.y;
    float _70 = _64.z;
    float2 _981 = float2(_58, _60);
    float _72 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_981, float2(0.0), isnan(_981))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_981, float2(0.0), isnan(_981))).x;
    float _74 = in.m_44.y;
    float _76 = in.m_46.y;
    float _78 = in.m_44.x;
    float _80 = in.m_48.y;
    float _82 = in.m_46.x;
    float _84 = in.m_48.x;
    float _86 = -_66;
    float _88 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _90 = fma(_86, (*spvDescriptorSet0.fp_c3)._m0[46].z, _88);
    float _92 = -_68;
    float _94 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _96 = fma(_92, (*spvDescriptorSet0.fp_c3)._m0[46].z, _94);
    float _98 = _74 * _90;
    float _100 = _78 * _90;
    float _102 = -_98;
    float _104 = fma(_96, _76, _102);
    float _106 = -_70;
    float _108 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _110 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[46].z, _108);
    float _112 = -_100;
    float _114 = fma(_96, _82, _112);
    float _116 = -_90;
    float _118 = _116 + _96;
    float _120 = _104 * _104;
    float _122 = -_98;
    float _124 = fma(_110, _80, _122);
    float _126 = -_100;
    float _128 = fma(_110, _84, _126);
    float _130 = -_90;
    float _132 = _130 + _110;
    float _134 = fma(_114, _114, _120);
    float _136 = _124 * _124;
    float _138 = -_72;
    float _140 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _142 = fma(_138, (*spvDescriptorSet0.fp_c3)._m0[46].z, _140);
    float _144 = fma(_118, _118, _134);
    float _146 = fma(_128, _128, _136);
    float _148 = _142 * _78;
    float _150 = -_142;
    bool _154 = _150 > (*spvDescriptorSet0.fp_c3)._m0[40].x;
    float _156 = _142 * _74;
    float _158 = fma(_132, _132, _146);
    float _160 = rsqrt(_144);
    float _162 = -_142;
    bool _164 = _162 > (*spvDescriptorSet0.fp_c3)._m0[39].x;
    float _166 = -_142;
    bool _168 = _166 > (*spvDescriptorSet0.fp_c3)._m0[41].x;
    float _170 = rsqrt(_158);
    int _173 = 2;
    if (!_154)
    {
        _173 = 1;
    }
    int _175 = _173;
    float _177 = _114 * _160;
    float _179 = _118 * _160;
    float _181 = _104 * _160;
    float _183 = _132 * _170;
    float _185 = _124 * _170;
    float _187 = _128 * _170;
    float _189 = _177 * _183;
    float _191 = _179 * _185;
    float _193 = _181 * _187;
    float _195 = -_189;
    float _197 = fma(_179, _187, _195);
    float _199 = -_191;
    float _201 = fma(_181, _183, _199);
    float _203 = -_193;
    float _205 = fma(_177, _185, _203);
    float _207 = _197 * _197;
    float _209 = fma(_201, _201, _207);
    bool _211 = !_154;
    int _213 = _211 ? 0 : 1;
    float _215 = fma(_205, _205, _209);
    int _217 = _175;
    if (!_164)
    {
        _217 = _213;
    }
    int _219 = _217;
    float _221 = rsqrt(_215);
    int _223 = _219 + 1;
    uint _226 = uint(_223);
    if (!_168)
    {
        _226 = uint(_219);
    }
    uint _228 = _226;
    uint _230 = min(_228, 2u);
    int _232 = int(_230) << 2;
    float _234 = _197 * _221;
    float _236 = _201 * _221;
    float _238 = _205 * _221;
    float _240 = _234 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    uint _242 = uint(int(uint(_232) >> uint(2)));
    uint _244 = uint(int(uint(int(_242)) >> uint(2)));
    int _246 = int(_242) & 3;
    float _248 = (*spvDescriptorSet0.fp_c1)._m0[int(_244)][_246];
    float _250 = fma(_236, (*spvDescriptorSet0.fp_c3)._m0[35].x, _240);
    float _252 = fma(_238, (*spvDescriptorSet0.fp_c3)._m0[35].z, _250);
    float _254 = abs(_252);
    float _256 = -_254;
    float _258 = _256 + 1.0;
    float _260 = precise::clamp(_258, 0.0, 1.0);
    float _262 = abs(_260);
    float _264 = log2(_262);
    float _266 = _264 * (*spvDescriptorSet0.fp_c3)._m0[48].z;
    float _268 = exp2(_266);
    float _270 = _268 * (*spvDescriptorSet0.fp_c3)._m0[48].y;
    float _272 = fma(_236, _270, _148);
    float _274 = fma(_234, _270, _156);
    float _276 = fma(_238, _270, _142);
    bool _278 = as_type<int>(_248) == 1264;
    if (!_278)
    {
        bool _280 = as_type<int>(_248) == 1536;
        _282 = _280;
        if (!_282)
        {
            _284 = true;
        }
    }
    float _318;
    float _320;
    float _322;
    float _324;
    if (!_282)
    {
        if (!_284)
        {
            float _286 = _274 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
            float _288 = _274 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
            float _290 = _274 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _292 = _274 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
            float _294 = fma(_272, (*spvDescriptorSet0.fp_c3)._m0[0].x, _286);
            float _296 = fma(_272, (*spvDescriptorSet0.fp_c3)._m0[1].x, _288);
            float _298 = fma(_272, (*spvDescriptorSet0.fp_c3)._m0[2].x, _290);
            float _300 = fma(_272, (*spvDescriptorSet0.fp_c3)._m0[3].x, _292);
            float _302 = fma(_276, (*spvDescriptorSet0.fp_c3)._m0[0].z, _294);
            float _304 = fma(_276, (*spvDescriptorSet0.fp_c3)._m0[1].z, _296);
            float _306 = fma(_276, (*spvDescriptorSet0.fp_c3)._m0[2].z, _298);
            float _308 = fma(_276, (*spvDescriptorSet0.fp_c3)._m0[3].z, _300);
            float _310 = _302 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
            float _312 = _304 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
            float _314 = _306 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
            float _316 = _308 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
            _318 = _316;
            _320 = _312;
            _322 = _314;
            _324 = _310;
        }
    }
    if ((false || _284) || _282)
    {
        if ((!_284) || _282)
        {
            _282 = false;
            float _326 = _274 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
            float _328 = _274 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
            float _330 = _274 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
            float _332 = _274 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
            float _334 = fma(_272, (*spvDescriptorSet0.fp_c3)._m0[4].x, _326);
            float _336 = fma(_272, (*spvDescriptorSet0.fp_c3)._m0[5].x, _328);
            float _338 = fma(_272, (*spvDescriptorSet0.fp_c3)._m0[6].x, _330);
            float _340 = fma(_272, (*spvDescriptorSet0.fp_c3)._m0[7].x, _332);
            float _342 = fma(_276, (*spvDescriptorSet0.fp_c3)._m0[4].z, _334);
            float _344 = fma(_276, (*spvDescriptorSet0.fp_c3)._m0[5].z, _336);
            float _346 = fma(_276, (*spvDescriptorSet0.fp_c3)._m0[6].z, _338);
            float _348 = fma(_276, (*spvDescriptorSet0.fp_c3)._m0[7].z, _340);
            float _350 = _342 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
            float _352 = _344 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
            float _354 = _346 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
            float _356 = _348 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
            _318 = _356;
            _320 = _352;
            _322 = _354;
            _324 = _350;
        }
        if (false || _284)
        {
            _284 = false;
            float _358 = _274 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
            float _360 = _274 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
            float _362 = _274 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
            float _364 = _274 * (*spvDescriptorSet0.fp_c3)._m0[11].y;
            float _366 = fma(_272, (*spvDescriptorSet0.fp_c3)._m0[8].x, _358);
            float _368 = fma(_272, (*spvDescriptorSet0.fp_c3)._m0[9].x, _360);
            float _370 = fma(_272, (*spvDescriptorSet0.fp_c3)._m0[10].x, _362);
            float _372 = fma(_272, (*spvDescriptorSet0.fp_c3)._m0[11].x, _364);
            float _374 = fma(_276, (*spvDescriptorSet0.fp_c3)._m0[8].z, _366);
            float _376 = fma(_276, (*spvDescriptorSet0.fp_c3)._m0[9].z, _368);
            float _378 = fma(_276, (*spvDescriptorSet0.fp_c3)._m0[10].z, _370);
            float _380 = fma(_276, (*spvDescriptorSet0.fp_c3)._m0[11].z, _372);
            float _382 = _374 + (*spvDescriptorSet0.fp_c3)._m0[8].w;
            float _384 = _376 + (*spvDescriptorSet0.fp_c3)._m0[9].w;
            float _386 = _378 + (*spvDescriptorSet0.fp_c3)._m0[10].w;
            float _388 = _380 + (*spvDescriptorSet0.fp_c3)._m0[11].w;
            _318 = _388;
            _320 = _384;
            _322 = _386;
            _324 = _382;
        }
    }
    float _390 = _318;
    float _392 = _320;
    float _394 = _322;
    float _396 = _324;
    float _398 = float(int(_228));
    float _400 = 1.0 / _390;
    float _402 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _404 = rint(_398);
    float _406 = precise::max(_404, 0.0);
    uint _408 = uint(_406);
    uint _410 = clamp(_408, 0u, 65535u);
    float _412 = _400 * _392;
    float _414 = _400 * _394;
    float _416 = precise::clamp(_414, 0.0, 1.0);
    float _418 = _400 * _396;
    float _420 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _422 = fma(_416, _402, _412);
    float _424 = fma(_416, _420, _418);
    float _426 = -_420;
    float _428 = fma(_416, _426, _418);
    float3 _1642 = float3(_418, _422, float(int(_410)));
    float3 _1646 = select(_1642, float3(0.0), isnan(_1642));
    float _430 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1646.xy, uint(rint(_1646.z)), _416);
    float3 _1655 = float3(_424, _422, float(int(_410)));
    float3 _1657 = select(_1655, float3(0.0), isnan(_1655));
    float _432 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1657.xy, uint(rint(_1657.z)), _416);
    float3 _1666 = float3(_428, _422, float(int(_410)));
    float3 _1668 = select(_1666, float3(0.0), isnan(_1666));
    float _434 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1668.xy, uint(rint(_1668.z)), _416);
    float3 _1677 = float3(_424, _412, float(int(_410)));
    float3 _1679 = select(_1677, float3(0.0), isnan(_1677));
    float _436 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1679.xy, uint(rint(_1679.z)), _416);
    float _438 = -_402;
    float _440 = fma(_416, _438, _412);
    float3 _1694 = float3(_418, _412, float(int(_410)));
    float3 _1696 = select(_1694, float3(0.0), isnan(_1694));
    float _442 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1696.xy, uint(rint(_1696.z)), _416);
    float3 _1705 = float3(_428, _412, float(int(_410)));
    float3 _1707 = select(_1705, float3(0.0), isnan(_1705));
    float _444 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1707.xy, uint(rint(_1707.z)), _416);
    float3 _1716 = float3(_424, _440, float(int(_410)));
    float3 _1718 = select(_1716, float3(0.0), isnan(_1716));
    float _446 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1718.xy, uint(rint(_1718.z)), _416);
    float3 _1727 = float3(_418, _440, float(int(_410)));
    float3 _1729 = select(_1727, float3(0.0), isnan(_1727));
    float _448 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1729.xy, uint(rint(_1729.z)), _416);
    float3 _1738 = float3(_428, _440, float(int(_410)));
    float3 _1740 = select(_1738, float3(0.0), isnan(_1738));
    float _450 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1740.xy, uint(rint(_1740.z)), _416);
    float _452 = -_156;
    float _454 = _452 + (*spvDescriptorSet0.fp_c3)._m0[42].y;
    float _456 = -_148;
    float _458 = _456 + (*spvDescriptorSet0.fp_c3)._m0[42].x;
    float _460 = _454 * _454;
    float _462 = fma(_458, _458, _460);
    float _464 = -_142;
    float _466 = _464 + (*spvDescriptorSet0.fp_c3)._m0[42].z;
    float _468 = fma(_466, _466, _462);
    float _470 = sqrt(_468);
    float _472 = _156 * (*spvDescriptorSet0.fp_c3)._m0[21].y;
    float _474 = _156 * (*spvDescriptorSet0.fp_c3)._m0[19].y;
    float _476 = _156 * (*spvDescriptorSet0.fp_c3)._m0[20].y;
    float _478 = _156 * (*spvDescriptorSet0.fp_c3)._m0[22].y;
    float _480 = _156 * (*spvDescriptorSet0.fp_c3)._m0[23].y;
    float _482 = _156 * (*spvDescriptorSet0.fp_c3)._m0[24].y;
    float _484 = fma(_148, (*spvDescriptorSet0.fp_c3)._m0[21].x, _472);
    float _486 = fma(_148, (*spvDescriptorSet0.fp_c3)._m0[19].x, _474);
    float _488 = fma(_148, (*spvDescriptorSet0.fp_c3)._m0[20].x, _476);
    float _490 = fma(_148, (*spvDescriptorSet0.fp_c3)._m0[22].x, _478);
    float _492 = fma(_148, (*spvDescriptorSet0.fp_c3)._m0[23].x, _480);
    float _494 = fma(_148, (*spvDescriptorSet0.fp_c3)._m0[24].x, _482);
    float _496 = fma(_142, (*spvDescriptorSet0.fp_c3)._m0[21].z, _484);
    float _498 = fma(_142, (*spvDescriptorSet0.fp_c3)._m0[19].z, _486);
    bool _500 = _470 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _502 = fma(_142, (*spvDescriptorSet0.fp_c3)._m0[20].z, _488);
    bool _504 = _470 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _506 = fma(_142, (*spvDescriptorSet0.fp_c3)._m0[22].z, _490);
    bool _508 = !_500;
    int _510 = _508 ? 0 : 1;
    float _512 = fma(_142, (*spvDescriptorSet0.fp_c3)._m0[23].z, _492);
    float _514 = fma(_142, (*spvDescriptorSet0.fp_c3)._m0[24].z, _494);
    float _516 = _502 + (*spvDescriptorSet0.fp_c3)._m0[20].w;
    float _518 = _156 * (*spvDescriptorSet0.fp_c3)._m0[17].y;
    float _520 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].z;
    float _522 = fma(_148, (*spvDescriptorSet0.fp_c3)._m0[17].x, _518);
    int _524 = 2;
    float _526 = _516;
    if (!_500)
    {
        _524 = 1;
    }
    int _528 = _524;
    int _530 = _528;
    if (!_504)
    {
        _530 = _510;
    }
    int _532 = _530;
    float _534 = _496 + (*spvDescriptorSet0.fp_c3)._m0[21].w;
    float _536 = _498 + (*spvDescriptorSet0.fp_c3)._m0[19].w;
    float _538 = _156 * (*spvDescriptorSet0.fp_c3)._m0[16].y;
    float _540 = float(_532);
    float _542 = fma(_142, (*spvDescriptorSet0.fp_c3)._m0[17].z, _522);
    float _544 = fma(_148, (*spvDescriptorSet0.fp_c3)._m0[16].x, _538);
    float _546 = precise::min(_540, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _548 = fma(_142, (*spvDescriptorSet0.fp_c3)._m0[16].z, _544);
    bool _550 = _546 != 1.0;
    bool _552 = isnan(_546);
    bool _554 = _550 || _552;
    bool _556 = isnan(1.0);
    bool _558 = _554 || _556;
    float _560 = _534;
    float _562 = _536;
    if (_558)
    {
        float _564 = _514 + (*spvDescriptorSet0.fp_c3)._m0[24].w;
        _560 = _564;
    }
    float _566 = _560;
    float _568 = _566;
    if (_558)
    {
        float _570 = _506 + (*spvDescriptorSet0.fp_c3)._m0[22].w;
        _562 = _570;
    }
    float _572 = _562;
    float _574 = _572;
    if (_558)
    {
        float _576 = _512 + (*spvDescriptorSet0.fp_c3)._m0[23].w;
        _526 = _576;
    }
    float _578 = _526;
    bool _580 = _546 != 0.0;
    bool _582 = isnan(_546);
    bool _584 = _580 || _582;
    bool _586 = isnan(0.0);
    bool _588 = _584 || _586;
    float _590 = _156 * (*spvDescriptorSet0.fp_c3)._m0[18].y;
    float _592 = rint(_546);
    float _594 = precise::max(_592, 0.0);
    uint _596 = uint(_594);
    uint _598 = clamp(_596, 0u, 65535u);
    float _600 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].w;
    float _602 = fma(_148, (*spvDescriptorSet0.fp_c3)._m0[18].x, _590);
    float _604 = fma(_142, (*spvDescriptorSet0.fp_c3)._m0[18].z, _602);
    float _606 = _578;
    if (!_588)
    {
        float _608 = _604 + (*spvDescriptorSet0.fp_c3)._m0[18].w;
        _568 = _608;
    }
    float _610 = _568;
    if (!_588)
    {
        float _612 = _548 + (*spvDescriptorSet0.fp_c3)._m0[16].w;
        _574 = _612;
    }
    float _614 = _574;
    if (!_588)
    {
        float _616 = _542 + (*spvDescriptorSet0.fp_c3)._m0[17].w;
        _606 = _616;
    }
    float _618 = _606;
    float _620 = 0.0 + _610;
    float _622 = precise::clamp(_620, 0.0, 1.0);
    float _624 = fma(_622, _600, _618);
    float _626 = fma(_622, _520, _614);
    float _628 = -_520;
    float _630 = fma(_622, _628, _614);
    float _632 = _432 + _430;
    float _634 = _632 + _434;
    float _636 = _634 + _436;
    float3 _2090 = float3(_614, _624, float(int(_598)));
    float3 _2092 = select(_2090, float3(0.0), isnan(_2090));
    float _638 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2092.xy, uint(rint(_2092.z)), _622);
    float3 _2101 = float3(_626, _624, float(int(_598)));
    float3 _2103 = select(_2101, float3(0.0), isnan(_2101));
    float _640 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2103.xy, uint(rint(_2103.z)), _622);
    float3 _2112 = float3(_630, _624, float(int(_598)));
    float3 _2114 = select(_2112, float3(0.0), isnan(_2112));
    float _642 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2114.xy, uint(rint(_2114.z)), _622);
    float3 _2123 = float3(_626, _618, float(int(_598)));
    float3 _2125 = select(_2123, float3(0.0), isnan(_2123));
    float _644 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2125.xy, uint(rint(_2125.z)), _622);
    float _646 = _636 + _442;
    float _648 = _646 + _444;
    float _650 = _648 + _446;
    float _652 = -_600;
    float _654 = fma(_622, _652, _618);
    float3 _2149 = float3(_614, _618, float(int(_598)));
    float3 _2151 = select(_2149, float3(0.0), isnan(_2149));
    float _656 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2151.xy, uint(rint(_2151.z)), _622);
    float3 _2160 = float3(_630, _618, float(int(_598)));
    float3 _2162 = select(_2160, float3(0.0), isnan(_2160));
    float _658 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2162.xy, uint(rint(_2162.z)), _622);
    float _660 = _650 + _448;
    float3 _2174 = float3(_626, _654, float(int(_598)));
    float3 _2176 = select(_2174, float3(0.0), isnan(_2174));
    float _662 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2176.xy, uint(rint(_2176.z)), _622);
    float2 _2182 = float2(_58, _60);
    float2 _666 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_2182, float2(0.0), isnan(_2182))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_2182, float2(0.0), isnan(_2182))).xy;
    float _668 = _666.x;
    float _670 = _666.y;
    float3 _2197 = float3(_614, _654, float(int(_598)));
    float3 _2199 = select(_2197, float3(0.0), isnan(_2197));
    float _672 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2199.xy, uint(rint(_2199.z)), _622);
    float _674 = _156 * (*spvDescriptorSet0.fp_c3)._m0[26].y;
    float _676 = _156 * (*spvDescriptorSet0.fp_c3)._m0[27].y;
    float _678 = _660 + _450;
    float _680 = _156 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _682 = _156 * (*spvDescriptorSet0.fp_c3)._m0[29].y;
    float _684 = _156 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _686 = _156 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    float _688 = _156 * (*spvDescriptorSet0.fp_c3)._m0[33].y;
    float _690 = fma(_148, (*spvDescriptorSet0.fp_c3)._m0[27].x, _676);
    float _692 = fma(_148, (*spvDescriptorSet0.fp_c3)._m0[28].x, _680);
    float _694 = fma(_148, (*spvDescriptorSet0.fp_c3)._m0[32].x, _686);
    float _696 = fma(_148, (*spvDescriptorSet0.fp_c3)._m0[33].x, _688);
    float _698 = fma(_142, (*spvDescriptorSet0.fp_c3)._m0[27].z, _690);
    float _700 = -_148;
    float _702 = _700 + (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _704 = fma(_148, (*spvDescriptorSet0.fp_c3)._m0[26].x, _674);
    float _706 = fma(_148, (*spvDescriptorSet0.fp_c3)._m0[31].x, _684);
    float _708 = fma(_142, (*spvDescriptorSet0.fp_c3)._m0[28].z, _692);
    float _710 = fma(_142, (*spvDescriptorSet0.fp_c3)._m0[32].z, _694);
    float _712 = fma(_142, (*spvDescriptorSet0.fp_c3)._m0[26].z, _704);
    float _714 = fma(_142, (*spvDescriptorSet0.fp_c3)._m0[31].z, _706);
    float _716 = _640 + _638;
    float _718 = _716 + _642;
    float _720 = _156 * (*spvDescriptorSet0.fp_c3)._m0[25].y;
    float _722 = _156 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    float _724 = -_156;
    float _726 = _724 + (*spvDescriptorSet0.fp_c3)._m0[43].y;
    float _728 = fma(_148, (*spvDescriptorSet0.fp_c3)._m0[25].x, _720);
    float _730 = fma(_148, (*spvDescriptorSet0.fp_c3)._m0[29].x, _682);
    float _732 = _726 * _726;
    float _734 = fma(_148, (*spvDescriptorSet0.fp_c3)._m0[30].x, _722);
    float _736 = fma(_142, (*spvDescriptorSet0.fp_c3)._m0[29].z, _730);
    float _738 = fma(_702, _702, _732);
    float _740 = -_142;
    float _742 = _740 + (*spvDescriptorSet0.fp_c3)._m0[43].z;
    float _744 = fma(_142, (*spvDescriptorSet0.fp_c3)._m0[30].z, _734);
    float _746 = fma(_142, (*spvDescriptorSet0.fp_c3)._m0[25].z, _728);
    float _748 = fma(_742, _742, _738);
    float _750 = _744 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _752 = sqrt(_748);
    bool _754 = _752 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    bool _756 = _752 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    bool _758 = !_754;
    int _760 = _758 ? 0 : 1;
    int _762 = 2;
    float _764 = _750;
    if (!_754)
    {
        _762 = 1;
    }
    int _766 = _762;
    int _768 = _766;
    if (!_756)
    {
        _768 = _760;
    }
    int _770 = _768;
    float _772 = fma(_142, (*spvDescriptorSet0.fp_c3)._m0[33].z, _696);
    float _774 = _708 + (*spvDescriptorSet0.fp_c3)._m0[28].w;
    float _776 = float(_770);
    float _778 = precise::min(_776, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _780 = _736 + (*spvDescriptorSet0.fp_c3)._m0[29].w;
    float _782 = _718 + _644;
    bool _784 = _778 != 1.0;
    bool _786 = isnan(_778);
    bool _788 = _784 || _786;
    bool _790 = isnan(1.0);
    bool _792 = _788 || _790;
    float _794 = _774;
    float _796 = _780;
    if (_792)
    {
        float _798 = _714 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
        _794 = _798;
    }
    float _800 = _794;
    float _802 = _800;
    if (_792)
    {
        float _804 = _710 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
        _796 = _804;
    }
    float _806 = _796;
    float _808 = _806;
    if (_792)
    {
        float _810 = _772 + (*spvDescriptorSet0.fp_c3)._m0[33].w;
        _764 = _810;
    }
    float _812 = _764;
    bool _814 = _778 != 0.0;
    bool _816 = isnan(_778);
    bool _818 = _814 || _816;
    bool _820 = isnan(0.0);
    bool _822 = _818 || _820;
    float _824 = rint(_778);
    float _826 = precise::max(_824, 0.0);
    uint _828 = uint(_826);
    uint _830 = clamp(_828, 0u, 65535u);
    float _832 = _812;
    if (!_822)
    {
        float _834 = _698 + (*spvDescriptorSet0.fp_c3)._m0[27].w;
        _832 = _834;
    }
    float _836 = _832;
    if (!_822)
    {
        float _838 = _746 + (*spvDescriptorSet0.fp_c3)._m0[25].w;
        _802 = _838;
    }
    float _840 = _802;
    if (!_822)
    {
        float _842 = _712 + (*spvDescriptorSet0.fp_c3)._m0[26].w;
        _808 = _842;
    }
    float _844 = _808;
    float _846 = 0.0 + _836;
    float _848 = precise::clamp(_846, 0.0, 1.0);
    float _850 = fma(_600, _848, _844);
    float _852 = fma(_520, _848, _840);
    float _854 = -_520;
    float _856 = fma(_854, _848, _840);
    float3 _2540 = float3(_630, _654, float(int(_598)));
    float3 _2542 = select(_2540, float3(0.0), isnan(_2540));
    float _858 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2542.xy, uint(rint(_2542.z)), _622);
    float3 _2551 = float3(_840, _850, float(int(_830)));
    float3 _2553 = select(_2551, float3(0.0), isnan(_2551));
    float _860 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2553.xy, uint(rint(_2553.z)), _848);
    float3 _2562 = float3(_852, _850, float(int(_830)));
    float3 _2564 = select(_2562, float3(0.0), isnan(_2562));
    float _862 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2564.xy, uint(rint(_2564.z)), _848);
    float3 _2573 = float3(_856, _850, float(int(_830)));
    float3 _2575 = select(_2573, float3(0.0), isnan(_2573));
    float _864 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2575.xy, uint(rint(_2575.z)), _848);
    float3 _2584 = float3(_852, _844, float(int(_830)));
    float3 _2586 = select(_2584, float3(0.0), isnan(_2584));
    float _866 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2586.xy, uint(rint(_2586.z)), _848);
    float _868 = _782 + _656;
    float _870 = fma(_670, 2.0, -1.0);
    float _872 = _868 + _658;
    float _874 = fma(_668, 2.0, -1.0);
    float _876 = _872 + _662;
    float _878 = _870 * (*spvDescriptorSet0.fp_c3)._m0[36].w;
    float _880 = -_600;
    float _882 = fma(_880, _848, _844);
    float _884 = fma(_878, 2.0, _60);
    float _886 = _874 * (*spvDescriptorSet0.fp_c3)._m0[36].z;
    float3 _2628 = float3(_840, _844, float(int(_830)));
    float3 _2630 = select(_2628, float3(0.0), isnan(_2628));
    float _888 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2630.xy, uint(rint(_2630.z)), _848);
    float3 _2639 = float3(_856, _844, float(int(_830)));
    float3 _2641 = select(_2639, float3(0.0), isnan(_2639));
    float _890 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2641.xy, uint(rint(_2641.z)), _848);
    float3 _2650 = float3(_852, _882, float(int(_830)));
    float3 _2652 = select(_2650, float3(0.0), isnan(_2650));
    float _892 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2652.xy, uint(rint(_2652.z)), _848);
    float _894 = fma(_886, 2.0, _58);
    float3 _2664 = float3(_840, _882, float(int(_830)));
    float3 _2666 = select(_2664, float3(0.0), isnan(_2664));
    float _896 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2666.xy, uint(rint(_2666.z)), _848);
    float3 _2675 = float3(_856, _882, float(int(_830)));
    float3 _2677 = select(_2675, float3(0.0), isnan(_2675));
    float _898 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2677.xy, uint(rint(_2677.z)), _848);
    float2 _2683 = float2(_894, _884);
    float _900 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_2683, float2(0.0), isnan(_2683))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_2683, float2(0.0), isnan(_2683))).x;
    float _902 = _876 + _672;
    float _904 = _902 + _858;
    float _906 = _862 + _860;
    float _908 = _906 + _864;
    float _910 = _908 + _866;
    float _912 = _910 + _888;
    float _914 = _912 + _890;
    float _916 = _914 + _892;
    float _918 = _904 * 0.111111111938953399658203125;
    float _920 = _916 + _896;
    float _922 = -_142;
    float _924 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _926 = _922 + _924;
    float _928 = -_142;
    float _930 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _932 = _928 + _930;
    float _934 = _920 + _898;
    float _936 = _926 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _938 = precise::clamp(_936, 0.0, 1.0);
    float _940 = _934 * 0.111111111938953399658203125;
    float _942 = fma(_678, 0.111111111938953399658203125, _938);
    float _944 = _940 * (*spvDescriptorSet0.fp_c3)._m0[49].w;
    float _946 = fma(_918, (*spvDescriptorSet0.fp_c3)._m0[49].z, _944);
    float _948 = _932 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _950 = precise::clamp(_948, 0.0, 1.0);
    float _952 = _946 + _950;
    out.m_51.x = _900;
    out.m_51.y = _942;
    out.m_51.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_51.w = _952;
    return out;
}

