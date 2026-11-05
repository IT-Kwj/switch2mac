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
    texture2d_array<float> fp_t_tcb_C [[id(4)]];
    sampler fp_t_tcb_CSmplr [[id(5)]];
    texture2d<float> fp_t_tcb_E [[id(6)]];
    sampler fp_t_tcb_ESmplr [[id(7)]];
    texture2d<float> fp_t_tcb_A [[id(8)]];
    sampler fp_t_tcb_ASmplr [[id(9)]];
    sampler fp_t_tcb_8Smplr_w [[id(10)]];
    sampler fp_t_tcb_ESmplr_w [[id(11)]];
    sampler fp_t_tcb_ASmplr_w [[id(12)]];
    constant dm_border_t* dm_border [[id(13)]];
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
    bool _286 = false;
    bool _284 = false;
    float _54 = in.m_38.x;
    float _56 = in.m_38.y;
    float2 _612 = float2(_54, _56);
    float3 _60 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_612, float2(0.0), isnan(_612)), int2(0), component::x).xyw;
    float _62 = _60.x;
    float _64 = _60.y;
    float _66 = _60.z;
    float2 _629 = float2(_54, _56);
    float _68 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_629, float2(0.0), isnan(_629))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_629, float2(0.0), isnan(_629))).x;
    float _70 = in.m_40.y;
    float _72 = in.m_42.y;
    float _74 = in.m_40.x;
    float _76 = in.m_44.y;
    float _78 = in.m_42.x;
    float _80 = in.m_44.x;
    float _82 = -_62;
    float _84 = fma(_82, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _86 = -_64;
    float _88 = fma(_86, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _90 = -_66;
    float _92 = fma(_90, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _94 = 1.0 / _84;
    float _96 = 1.0 / _88;
    float _98 = 1.0 / _92;
    float _100 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _102 = _94 * _100;
    float _104 = _70 * _102;
    float _106 = _74 * _102;
    float _108 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _110 = _96 * _108;
    float _112 = -_104;
    float _114 = fma(_110, _72, _112);
    float _116 = -_106;
    float _118 = fma(_110, _78, _116);
    float _120 = -_102;
    float _122 = _120 + _110;
    float _124 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _126 = _98 * _124;
    float _128 = _114 * _114;
    float _130 = -_104;
    float _132 = fma(_126, _76, _130);
    float _134 = -_106;
    float _136 = fma(_126, _80, _134);
    float _138 = fma(_118, _118, _128);
    float _140 = -_102;
    float _142 = _140 + _126;
    float _144 = _132 * _132;
    float _146 = fma(_122, _122, _138);
    float _148 = fma(_136, _136, _144);
    float _150 = fma(_142, _142, _148);
    float _152 = rsqrt(_146);
    float _154 = rsqrt(_150);
    float _156 = -_68;
    float _158 = fma(_156, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _160 = _118 * _152;
    float _162 = _122 * _152;
    float _164 = 1.0 / _158;
    float _166 = _114 * _152;
    float _168 = _142 * _154;
    float _170 = _132 * _154;
    float _172 = _136 * _154;
    float _174 = _160 * _168;
    float _176 = _162 * _170;
    float _178 = -_174;
    float _180 = fma(_162, _172, _178);
    float _182 = _166 * _172;
    float _184 = -_176;
    float _186 = fma(_166, _168, _184);
    float _188 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _190 = _164 * _188;
    float _192 = _180 * _180;
    float _194 = -_182;
    float _196 = fma(_160, _170, _194);
    float _198 = _190 * _70;
    float _200 = fma(_186, _186, _192);
    float _202 = -_190;
    bool _206 = _202 > (*spvDescriptorSet0.fp_c3)._m0[40].x;
    float _208 = _190 * _74;
    float _210 = -_190;
    bool _212 = _210 > (*spvDescriptorSet0.fp_c3)._m0[39].x;
    float _214 = fma(_196, _196, _200);
    bool _216 = !_206;
    uint _219 = uint(_216 ? 0 : 1);
    float _221 = rsqrt(_214);
    uint _223 = 2u;
    if (!_206)
    {
        _223 = 1u;
    }
    uint _225 = _223;
    uint _227 = _225;
    if (!_212)
    {
        _227 = _219;
    }
    uint _229 = _227;
    uint _231 = min(_229, 2u);
    float _233 = _180 * _221;
    float _235 = _186 * _221;
    float _237 = _196 * _221;
    int _240 = int(_231) << 2;
    float _242 = _233 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    uint _244 = uint(int(uint(_240) >> uint(2)));
    uint _246 = uint(int(uint(int(_244)) >> uint(2)));
    int _248 = int(_244) & 3;
    float _250 = (*spvDescriptorSet0.fp_c1)._m0[int(_246)][_248];
    float _252 = fma(_235, (*spvDescriptorSet0.fp_c3)._m0[35].x, _242);
    float _254 = fma(_237, (*spvDescriptorSet0.fp_c3)._m0[35].z, _252);
    float _256 = abs(_254);
    float _258 = -_256;
    float _260 = _258 + 1.0;
    float _262 = precise::clamp(_260, 0.0, 1.0);
    float _264 = abs(_262);
    float _266 = log2(_264);
    float _268 = _266 * (*spvDescriptorSet0.fp_c3)._m0[48].z;
    float _270 = exp2(_268);
    float _272 = _270 * (*spvDescriptorSet0.fp_c3)._m0[48].y;
    float _274 = fma(_235, _272, _208);
    float _276 = fma(_233, _272, _198);
    float _278 = fma(_237, _272, _190);
    bool _280 = as_type<int>(_250) == 1344;
    if (!_280)
    {
        bool _282 = as_type<int>(_250) == 1616;
        _284 = _282;
        if (!_284)
        {
            _286 = true;
        }
    }
    float _320;
    float _322;
    float _324;
    float _326;
    if (!_284)
    {
        if (!_286)
        {
            float _288 = _276 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
            float _290 = _276 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
            float _292 = _276 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _294 = _276 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
            float _296 = fma(_274, (*spvDescriptorSet0.fp_c3)._m0[0].x, _288);
            float _298 = fma(_274, (*spvDescriptorSet0.fp_c3)._m0[1].x, _290);
            float _300 = fma(_274, (*spvDescriptorSet0.fp_c3)._m0[2].x, _292);
            float _302 = fma(_274, (*spvDescriptorSet0.fp_c3)._m0[3].x, _294);
            float _304 = fma(_278, (*spvDescriptorSet0.fp_c3)._m0[0].z, _296);
            float _306 = fma(_278, (*spvDescriptorSet0.fp_c3)._m0[1].z, _298);
            float _308 = fma(_278, (*spvDescriptorSet0.fp_c3)._m0[2].z, _300);
            float _310 = fma(_278, (*spvDescriptorSet0.fp_c3)._m0[3].z, _302);
            float _312 = _304 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
            float _314 = _306 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
            float _316 = _308 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
            float _318 = _310 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
            _320 = _318;
            _322 = _316;
            _324 = _312;
            _326 = _314;
        }
    }
    if ((false || _286) || _284)
    {
        if ((!_286) || _284)
        {
            _284 = false;
            float _328 = _276 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
            float _330 = _276 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
            float _332 = _276 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
            float _334 = _276 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
            float _336 = fma(_274, (*spvDescriptorSet0.fp_c3)._m0[4].x, _328);
            float _338 = fma(_274, (*spvDescriptorSet0.fp_c3)._m0[5].x, _330);
            float _340 = fma(_274, (*spvDescriptorSet0.fp_c3)._m0[6].x, _332);
            float _342 = fma(_274, (*spvDescriptorSet0.fp_c3)._m0[7].x, _334);
            float _344 = fma(_278, (*spvDescriptorSet0.fp_c3)._m0[4].z, _336);
            float _346 = fma(_278, (*spvDescriptorSet0.fp_c3)._m0[5].z, _338);
            float _348 = fma(_278, (*spvDescriptorSet0.fp_c3)._m0[6].z, _340);
            float _350 = fma(_278, (*spvDescriptorSet0.fp_c3)._m0[7].z, _342);
            float _352 = _344 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
            float _354 = _346 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
            float _356 = _348 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
            float _358 = _350 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
            _320 = _358;
            _322 = _356;
            _324 = _352;
            _326 = _354;
        }
        if (false || _286)
        {
            _286 = false;
            float _360 = _276 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
            float _362 = _276 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
            float _364 = _276 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
            float _366 = _276 * (*spvDescriptorSet0.fp_c3)._m0[11].y;
            float _368 = fma(_274, (*spvDescriptorSet0.fp_c3)._m0[8].x, _360);
            float _370 = fma(_274, (*spvDescriptorSet0.fp_c3)._m0[9].x, _362);
            float _372 = fma(_274, (*spvDescriptorSet0.fp_c3)._m0[10].x, _364);
            float _374 = fma(_274, (*spvDescriptorSet0.fp_c3)._m0[11].x, _366);
            float _376 = fma(_278, (*spvDescriptorSet0.fp_c3)._m0[8].z, _368);
            float _378 = fma(_278, (*spvDescriptorSet0.fp_c3)._m0[9].z, _370);
            float _380 = fma(_278, (*spvDescriptorSet0.fp_c3)._m0[10].z, _372);
            float _382 = fma(_278, (*spvDescriptorSet0.fp_c3)._m0[11].z, _374);
            float _384 = _376 + (*spvDescriptorSet0.fp_c3)._m0[8].w;
            float _386 = _378 + (*spvDescriptorSet0.fp_c3)._m0[9].w;
            float _388 = _380 + (*spvDescriptorSet0.fp_c3)._m0[10].w;
            float _390 = _382 + (*spvDescriptorSet0.fp_c3)._m0[11].w;
            _320 = _390;
            _322 = _388;
            _324 = _384;
            _326 = _386;
        }
    }
    float _392 = _320;
    float _394 = _322;
    float _396 = _324;
    float _398 = _326;
    float _400 = 1.0 / _392;
    float _402 = float(int(_229));
    float _404 = rint(_402);
    float _406 = precise::max(_404, 0.0);
    uint _408 = uint(_406);
    uint _410 = clamp(_408, 0u, 65535u);
    float _412 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _414 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _416 = _400 * _394;
    float _418 = precise::clamp(_416, 0.0, 1.0);
    float _420 = _400 * _396;
    float _422 = _400 * _398;
    float _424 = _418 * _412;
    float _426 = _418 * _414;
    float _428 = fma(_424, 0.5, _420);
    float _430 = fma(_426, 0.5, _422);
    float _432 = fma(_426, 1.5, _422);
    float _434 = fma(_424, -0.5, _420);
    float _436 = fma(_424, 1.5, _420);
    float3 _1300 = float3(_428, _432, float(int(_410)));
    float3 _1304 = select(_1300, float3(0.0), isnan(_1300));
    float _438 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1304.xy, uint(rint(_1304.z)), _418);
    float3 _1313 = float3(_434, _432, float(int(_410)));
    float3 _1315 = select(_1313, float3(0.0), isnan(_1313));
    float _440 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1315.xy, uint(rint(_1315.z)), _418);
    float3 _1324 = float3(_436, _430, float(int(_410)));
    float3 _1326 = select(_1324, float3(0.0), isnan(_1324));
    float _442 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1326.xy, uint(rint(_1326.z)), _418);
    float3 _1335 = float3(_428, _430, float(int(_410)));
    float3 _1337 = select(_1335, float3(0.0), isnan(_1335));
    float _444 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1337.xy, uint(rint(_1337.z)), _418);
    float3 _1346 = float3(_434, _430, float(int(_410)));
    float3 _1348 = select(_1346, float3(0.0), isnan(_1346));
    float _446 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1348.xy, uint(rint(_1348.z)), _418);
    float _448 = fma(_424, -1.5, _420);
    float _450 = fma(_426, -0.5, _422);
    float3 _1364 = float3(_448, _430, float(int(_410)));
    float3 _1366 = select(_1364, float3(0.0), isnan(_1364));
    float _452 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1366.xy, uint(rint(_1366.z)), _418);
    float3 _1375 = float3(_428, _450, float(int(_410)));
    float3 _1377 = select(_1375, float3(0.0), isnan(_1375));
    float _454 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1377.xy, uint(rint(_1377.z)), _418);
    float3 _1386 = float3(_448, _432, float(int(_410)));
    float3 _1388 = select(_1386, float3(0.0), isnan(_1386));
    float _456 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1388.xy, uint(rint(_1388.z)), _418);
    float3 _1397 = float3(_436, _432, float(int(_410)));
    float3 _1399 = select(_1397, float3(0.0), isnan(_1397));
    float _458 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1399.xy, uint(rint(_1399.z)), _418);
    float3 _1408 = float3(_436, _450, float(int(_410)));
    float3 _1410 = select(_1408, float3(0.0), isnan(_1408));
    float _460 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1410.xy, uint(rint(_1410.z)), _418);
    float3 _1419 = float3(_434, _450, float(int(_410)));
    float3 _1421 = select(_1419, float3(0.0), isnan(_1419));
    float _462 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1421.xy, uint(rint(_1421.z)), _418);
    float3 _1430 = float3(_448, _450, float(int(_410)));
    float3 _1432 = select(_1430, float3(0.0), isnan(_1430));
    float _464 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1432.xy, uint(rint(_1432.z)), _418);
    float _466 = fma(_426, -1.5, _422);
    float _468 = _198 * (*spvDescriptorSet0.fp_c3)._m0[15].y;
    float _470 = _198 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
    float _472 = fma(_208, (*spvDescriptorSet0.fp_c3)._m0[15].x, _468);
    float _474 = _198 * (*spvDescriptorSet0.fp_c3)._m0[12].y;
    float _476 = fma(_208, (*spvDescriptorSet0.fp_c3)._m0[13].x, _470);
    float _478 = fma(_190, (*spvDescriptorSet0.fp_c3)._m0[15].z, _472);
    float _480 = fma(_208, (*spvDescriptorSet0.fp_c3)._m0[12].x, _474);
    float _482 = fma(_190, (*spvDescriptorSet0.fp_c3)._m0[13].z, _476);
    float _484 = _478 + (*spvDescriptorSet0.fp_c3)._m0[15].w;
    float _486 = fma(_190, (*spvDescriptorSet0.fp_c3)._m0[12].z, _480);
    float _488 = _482 + (*spvDescriptorSet0.fp_c3)._m0[13].w;
    float _490 = 1.0 / _484;
    float _492 = _486 + (*spvDescriptorSet0.fp_c3)._m0[12].w;
    float _494 = _492 * _490;
    float _496 = _488 * _490;
    float2 _1506 = float2(_494, _496);
    float2 _500 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_1506, float2(0.0), isnan(_1506))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_1506, float2(0.0), isnan(_1506))).xy;
    float _502 = _500.x;
    float _504 = _500.y;
    float3 _1521 = float3(_436, _466, float(int(_410)));
    float3 _1523 = select(_1521, float3(0.0), isnan(_1521));
    float _506 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1523.xy, uint(rint(_1523.z)), _418);
    float3 _1532 = float3(_428, _466, float(int(_410)));
    float3 _1534 = select(_1532, float3(0.0), isnan(_1532));
    float _508 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1534.xy, uint(rint(_1534.z)), _418);
    float3 _1543 = float3(_434, _466, float(int(_410)));
    float3 _1545 = select(_1543, float3(0.0), isnan(_1543));
    float _510 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1545.xy, uint(rint(_1545.z)), _418);
    float3 _1554 = float3(_448, _466, float(int(_410)));
    float3 _1556 = select(_1554, float3(0.0), isnan(_1554));
    float _512 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1556.xy, uint(rint(_1556.z)), _418);
    float2 _1562 = float2(_54, _56);
    float _514 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1562, float2(0.0), isnan(_1562))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1562, float2(0.0), isnan(_1562))).x;
    float _516 = _198 * (*spvDescriptorSet0.fp_c3)._m0[14].y;
    float _518 = fma(_208, (*spvDescriptorSet0.fp_c3)._m0[14].x, _516);
    float _520 = fma(_190, (*spvDescriptorSet0.fp_c3)._m0[14].z, _518);
    float _522 = _520 + (*spvDescriptorSet0.fp_c3)._m0[14].w;
    float _524 = precise::min(_522, 1.0);
    float _526 = _458 + _438;
    float _528 = _526 + _440;
    float _530 = _528 + _456;
    float _532 = _530 + _442;
    float _534 = _532 + _444;
    float _536 = _534 + _446;
    float _538 = _536 + _452;
    float _540 = _538 + _460;
    float _542 = _540 + _454;
    float _544 = _542 + _462;
    float _546 = _544 + _464;
    float _548 = -_502;
    float _550 = fma(_548, _502, _504);
    float _552 = -_502;
    float _554 = _524 + _552;
    float _556 = _546 + _506;
    float _558 = fma(_554, _554, _550);
    float _560 = _556 + _508;
    bool _562 = _554 <= 0.001000000047497451305389404296875;
    float _564 = float(_562);
    float _566 = 1.0 / _558;
    float _568 = _560 + _510;
    float _570 = -_190;
    float _572 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _574 = _570 + _572;
    float _576 = _568 + _512;
    float _578 = _574 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _580 = precise::clamp(_578, 0.0, 1.0);
    float _582 = _550 * _566;
    float _584 = -_190;
    float _586 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _588 = _584 + _586;
    float _590 = precise::max(_582, _564);
    float _592 = _588 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _594 = precise::clamp(_592, 0.0, 1.0);
    float _596 = precise::min(_590, 1.0);
    float _598 = fma(_576, 0.0625, _594);
    float _600 = _596 + _580;
    out.m_47.x = _514;
    out.m_47.y = _598;
    out.m_47.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_47.w = _600;
    return out;
}

