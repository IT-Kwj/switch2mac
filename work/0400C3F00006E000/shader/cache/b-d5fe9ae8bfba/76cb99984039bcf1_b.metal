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
    texture2d<float> fp_t_tcb_C [[id(6)]];
    sampler fp_t_tcb_CSmplr [[id(7)]];
    texture2d<float> fp_t_tcb_10 [[id(8)]];
    sampler fp_t_tcb_10Smplr [[id(9)]];
    texture2d<float> fp_t_tcb_A [[id(10)]];
    sampler fp_t_tcb_ASmplr [[id(11)]];
    sampler fp_t_tcb_8Smplr_w [[id(12)]];
    sampler fp_t_tcb_CSmplr_w [[id(13)]];
    sampler fp_t_tcb_10Smplr_w [[id(14)]];
    sampler fp_t_tcb_ASmplr_w [[id(15)]];
    constant dm_border_t* dm_border [[id(16)]];
};

struct main0_out
{
    float4 m_49 [[color(0)]];
};

struct main0_in
{
    float4 m_42 [[user(locn0), center_no_perspective]];
    float4 m_46 [[user(locn1), center_no_perspective]];
    float4 m_44 [[user(locn2), center_no_perspective]];
    float4 m_40 [[user(locn3), center_no_perspective]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    bool _272 = false;
    bool _270 = false;
    float _56 = in.m_40.x;
    float _58 = in.m_40.y;
    float2 _616 = float2(_56, _58);
    float3 _62 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_616, float2(0.0), isnan(_616)), int2(0), component::x).xyw;
    float _64 = _62.x;
    float _66 = _62.y;
    float _68 = _62.z;
    float2 _633 = float2(_56, _58);
    float _70 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_633, float2(0.0), isnan(_633))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_633, float2(0.0), isnan(_633))).x;
    float _72 = in.m_42.y;
    float _74 = in.m_42.x;
    float _76 = in.m_44.y;
    float _78 = in.m_46.y;
    float _80 = in.m_44.x;
    float _82 = in.m_46.x;
    float _84 = -_64;
    float _86 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _88 = fma(_84, (*spvDescriptorSet0.fp_c3)._m0[46].z, _86);
    float _90 = -_66;
    float _92 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _94 = fma(_90, (*spvDescriptorSet0.fp_c3)._m0[46].z, _92);
    float _96 = -_68;
    float _98 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _100 = fma(_96, (*spvDescriptorSet0.fp_c3)._m0[46].z, _98);
    float _102 = _72 * _88;
    float _104 = _74 * _88;
    float _106 = -_102;
    float _108 = fma(_94, _76, _106);
    float _110 = -_102;
    float _112 = fma(_100, _78, _110);
    float _114 = -_104;
    float _116 = fma(_94, _80, _114);
    float _118 = -_104;
    float _120 = fma(_100, _82, _118);
    float _122 = _108 * _108;
    float _124 = _112 * _112;
    float _126 = -_88;
    float _128 = _126 + _94;
    float _130 = -_88;
    float _132 = _130 + _100;
    float _134 = fma(_116, _116, _122);
    float _136 = fma(_120, _120, _124);
    float _138 = fma(_128, _128, _134);
    float _140 = fma(_132, _132, _136);
    float _142 = rsqrt(_138);
    float _144 = rsqrt(_140);
    float _146 = _116 * _142;
    float _148 = _128 * _142;
    float _150 = _108 * _142;
    float _152 = _132 * _144;
    float _154 = _112 * _144;
    float _156 = _120 * _144;
    float _158 = _146 * _152;
    float _160 = _148 * _154;
    float _162 = -_158;
    float _164 = fma(_148, _156, _162);
    float _166 = -_160;
    float _168 = fma(_150, _152, _166);
    float _170 = _150 * _156;
    float _172 = -_70;
    float _174 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _176 = fma(_172, (*spvDescriptorSet0.fp_c3)._m0[46].z, _174);
    float _178 = _164 * _164;
    float _180 = -_170;
    float _182 = fma(_146, _154, _180);
    float _184 = _176 * _74;
    float _186 = fma(_168, _168, _178);
    float _188 = -_176;
    bool _192 = _188 > (*spvDescriptorSet0.fp_c3)._m0[40].x;
    float _194 = _176 * _72;
    float _196 = -_176;
    bool _198 = _196 > (*spvDescriptorSet0.fp_c3)._m0[39].x;
    float _200 = fma(_182, _182, _186);
    bool _202 = !_192;
    uint _205 = uint(_202 ? 0 : 1);
    float _207 = rsqrt(_200);
    uint _209 = 2u;
    if (!_192)
    {
        _209 = 1u;
    }
    uint _211 = _209;
    uint _213 = _211;
    if (!_198)
    {
        _213 = _205;
    }
    uint _215 = _213;
    uint _217 = min(_215, 2u);
    int _220 = int(_217) << 2;
    float _222 = _164 * _207;
    float _224 = _168 * _207;
    float _226 = _182 * _207;
    float _228 = _222 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    uint _230 = uint(int(uint(_220) >> uint(2)));
    uint _232 = uint(int(uint(int(_230)) >> uint(2)));
    int _234 = int(_230) & 3;
    float _236 = (*spvDescriptorSet0.fp_c1)._m0[int(_232)][_234];
    float _238 = fma(_224, (*spvDescriptorSet0.fp_c3)._m0[35].x, _228);
    float _240 = fma(_226, (*spvDescriptorSet0.fp_c3)._m0[35].z, _238);
    float _242 = abs(_240);
    float _244 = -_242;
    float _246 = _244 + 1.0;
    float _248 = precise::clamp(_246, 0.0, 1.0);
    float _250 = abs(_248);
    float _252 = log2(_250);
    float _254 = _252 * (*spvDescriptorSet0.fp_c3)._m0[48].z;
    float _256 = exp2(_254);
    float _258 = _256 * (*spvDescriptorSet0.fp_c3)._m0[48].y;
    float _260 = fma(_224, _258, _184);
    float _262 = fma(_222, _258, _194);
    float _264 = fma(_226, _258, _176);
    bool _266 = as_type<int>(_236) == 1216;
    if (!_266)
    {
        bool _268 = as_type<int>(_236) == 1488;
        _270 = _268;
        if (!_270)
        {
            _272 = true;
        }
    }
    float _306;
    float _308;
    float _310;
    float _312;
    if (!_270)
    {
        if (!_272)
        {
            float _274 = _262 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
            float _276 = _262 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
            float _278 = _262 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _280 = _262 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
            float _282 = fma(_260, (*spvDescriptorSet0.fp_c3)._m0[0].x, _274);
            float _284 = fma(_260, (*spvDescriptorSet0.fp_c3)._m0[1].x, _276);
            float _286 = fma(_260, (*spvDescriptorSet0.fp_c3)._m0[2].x, _278);
            float _288 = fma(_260, (*spvDescriptorSet0.fp_c3)._m0[3].x, _280);
            float _290 = fma(_264, (*spvDescriptorSet0.fp_c3)._m0[0].z, _282);
            float _292 = fma(_264, (*spvDescriptorSet0.fp_c3)._m0[1].z, _284);
            float _294 = fma(_264, (*spvDescriptorSet0.fp_c3)._m0[2].z, _286);
            float _296 = fma(_264, (*spvDescriptorSet0.fp_c3)._m0[3].z, _288);
            float _298 = _290 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
            float _300 = _292 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
            float _302 = _294 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
            float _304 = _296 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
            _306 = _304;
            _308 = _302;
            _310 = _298;
            _312 = _300;
        }
    }
    if ((false || _272) || _270)
    {
        if ((!_272) || _270)
        {
            _270 = false;
            float _314 = _262 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
            float _316 = _262 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
            float _318 = _262 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
            float _320 = _262 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
            float _322 = fma(_260, (*spvDescriptorSet0.fp_c3)._m0[4].x, _314);
            float _324 = fma(_260, (*spvDescriptorSet0.fp_c3)._m0[5].x, _316);
            float _326 = fma(_260, (*spvDescriptorSet0.fp_c3)._m0[6].x, _318);
            float _328 = fma(_260, (*spvDescriptorSet0.fp_c3)._m0[7].x, _320);
            float _330 = fma(_264, (*spvDescriptorSet0.fp_c3)._m0[4].z, _322);
            float _332 = fma(_264, (*spvDescriptorSet0.fp_c3)._m0[5].z, _324);
            float _334 = fma(_264, (*spvDescriptorSet0.fp_c3)._m0[6].z, _326);
            float _336 = fma(_264, (*spvDescriptorSet0.fp_c3)._m0[7].z, _328);
            float _338 = _330 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
            float _340 = _332 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
            float _342 = _334 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
            float _344 = _336 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
            _306 = _344;
            _308 = _342;
            _310 = _338;
            _312 = _340;
        }
        if (false || _272)
        {
            _272 = false;
            float _346 = _262 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
            float _348 = _262 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
            float _350 = _262 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
            float _352 = _262 * (*spvDescriptorSet0.fp_c3)._m0[11].y;
            float _354 = fma(_260, (*spvDescriptorSet0.fp_c3)._m0[8].x, _346);
            float _356 = fma(_260, (*spvDescriptorSet0.fp_c3)._m0[9].x, _348);
            float _358 = fma(_260, (*spvDescriptorSet0.fp_c3)._m0[10].x, _350);
            float _360 = fma(_260, (*spvDescriptorSet0.fp_c3)._m0[11].x, _352);
            float _362 = fma(_264, (*spvDescriptorSet0.fp_c3)._m0[8].z, _354);
            float _364 = fma(_264, (*spvDescriptorSet0.fp_c3)._m0[9].z, _356);
            float _366 = fma(_264, (*spvDescriptorSet0.fp_c3)._m0[10].z, _358);
            float _368 = fma(_264, (*spvDescriptorSet0.fp_c3)._m0[11].z, _360);
            float _370 = _362 + (*spvDescriptorSet0.fp_c3)._m0[8].w;
            float _372 = _364 + (*spvDescriptorSet0.fp_c3)._m0[9].w;
            float _374 = _366 + (*spvDescriptorSet0.fp_c3)._m0[10].w;
            float _376 = _368 + (*spvDescriptorSet0.fp_c3)._m0[11].w;
            _306 = _376;
            _308 = _374;
            _310 = _370;
            _312 = _372;
        }
    }
    float _378 = _306;
    float _380 = _308;
    float _382 = _310;
    float _384 = _312;
    float _386 = 1.0 / _378;
    float _388 = float(int(_215));
    float _390 = rint(_388);
    float _392 = precise::max(_390, 0.0);
    uint _394 = uint(_392);
    uint _396 = clamp(_394, 0u, 65535u);
    float _398 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _400 = _386 * _380;
    float _402 = precise::clamp(_400, 0.0, 1.0);
    float _404 = _386 * _382;
    float _406 = _386 * _384;
    float _408 = _402 * _398;
    float _410 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _412 = _402 * _410;
    float _414 = fma(_408, 0.5, _404);
    float _416 = fma(_412, 1.5, _406);
    float _418 = fma(_408, -0.5, _404);
    float _420 = fma(_408, -1.5, _404);
    float _422 = fma(_408, 1.5, _404);
    float3 _1289 = float3(_414, _416, float(int(_396)));
    float3 _1293 = select(_1289, float3(0.0), isnan(_1289));
    float _424 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1293.xy, uint(rint(_1293.z)), _402);
    float3 _1302 = float3(_418, _416, float(int(_396)));
    float3 _1304 = select(_1302, float3(0.0), isnan(_1302));
    float _426 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1304.xy, uint(rint(_1304.z)), _402);
    float3 _1313 = float3(_420, _416, float(int(_396)));
    float3 _1315 = select(_1313, float3(0.0), isnan(_1313));
    float _428 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1315.xy, uint(rint(_1315.z)), _402);
    float3 _1324 = float3(_422, _416, float(int(_396)));
    float3 _1326 = select(_1324, float3(0.0), isnan(_1324));
    float _430 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1326.xy, uint(rint(_1326.z)), _402);
    float _432 = fma(_412, 0.5, _406);
    float3 _1338 = float3(_422, _432, float(int(_396)));
    float3 _1340 = select(_1338, float3(0.0), isnan(_1338));
    float _434 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1340.xy, uint(rint(_1340.z)), _402);
    float3 _1349 = float3(_414, _432, float(int(_396)));
    float3 _1351 = select(_1349, float3(0.0), isnan(_1349));
    float _436 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1351.xy, uint(rint(_1351.z)), _402);
    float3 _1360 = float3(_418, _432, float(int(_396)));
    float3 _1362 = select(_1360, float3(0.0), isnan(_1360));
    float _438 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1362.xy, uint(rint(_1362.z)), _402);
    float3 _1371 = float3(_420, _432, float(int(_396)));
    float3 _1373 = select(_1371, float3(0.0), isnan(_1371));
    float _440 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1373.xy, uint(rint(_1373.z)), _402);
    float2 _1379 = float2(_56, _58);
    float2 _444 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_1379, float2(0.0), isnan(_1379))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_1379, float2(0.0), isnan(_1379))).xy;
    float _446 = _444.x;
    float _448 = _444.y;
    float _450 = fma(_412, -1.5, _406);
    float _452 = _430 + _424;
    float _454 = _452 + _426;
    float _456 = _454 + _428;
    float _458 = _456 + _434;
    float _460 = fma(_412, -0.5, _406);
    float _462 = _458 + _436;
    float3 _1415 = float3(_422, _460, float(int(_396)));
    float3 _1417 = select(_1415, float3(0.0), isnan(_1415));
    float _464 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1417.xy, uint(rint(_1417.z)), _402);
    float3 _1426 = float3(_414, _460, float(int(_396)));
    float3 _1428 = select(_1426, float3(0.0), isnan(_1426));
    float _466 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1428.xy, uint(rint(_1428.z)), _402);
    float3 _1437 = float3(_418, _460, float(int(_396)));
    float3 _1439 = select(_1437, float3(0.0), isnan(_1437));
    float _468 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1439.xy, uint(rint(_1439.z)), _402);
    float3 _1448 = float3(_420, _460, float(int(_396)));
    float3 _1450 = select(_1448, float3(0.0), isnan(_1448));
    float _470 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1450.xy, uint(rint(_1450.z)), _402);
    float _472 = _194 * (*spvDescriptorSet0.fp_c3)._m0[15].y;
    float _474 = _194 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
    float _476 = _462 + _438;
    float _478 = fma(_184, (*spvDescriptorSet0.fp_c3)._m0[15].x, _472);
    float _480 = _194 * (*spvDescriptorSet0.fp_c3)._m0[12].y;
    float _482 = fma(_176, (*spvDescriptorSet0.fp_c3)._m0[15].z, _478);
    float _484 = _482 + (*spvDescriptorSet0.fp_c3)._m0[15].w;
    float _486 = fma(_184, (*spvDescriptorSet0.fp_c3)._m0[12].x, _480);
    float _488 = fma(_184, (*spvDescriptorSet0.fp_c3)._m0[13].x, _474);
    float _490 = fma(_176, (*spvDescriptorSet0.fp_c3)._m0[12].z, _486);
    float _492 = 1.0 / _484;
    float _494 = fma(_176, (*spvDescriptorSet0.fp_c3)._m0[13].z, _488);
    float _496 = _490 + (*spvDescriptorSet0.fp_c3)._m0[12].w;
    float _498 = _494 + (*spvDescriptorSet0.fp_c3)._m0[13].w;
    float _500 = fma(_446, 2.0, -1.0);
    float _502 = fma(_448, 2.0, -1.0);
    float _504 = _496 * _492;
    float _506 = _498 * _492;
    float _508 = _476 + _440;
    float _510 = _500 * (*spvDescriptorSet0.fp_c3)._m0[36].z;
    float _512 = _502 * (*spvDescriptorSet0.fp_c3)._m0[36].w;
    float2 _1542 = float2(_504, _506);
    float2 _514 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_1542, float2(0.0), isnan(_1542))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_1542, float2(0.0), isnan(_1542))).xy;
    float _516 = _514.x;
    float _518 = _514.y;
    float _520 = fma(_510, 2.0, _56);
    float _522 = fma(_512, 2.0, _58);
    float3 _1563 = float3(_422, _450, float(int(_396)));
    float3 _1565 = select(_1563, float3(0.0), isnan(_1563));
    float _524 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1565.xy, uint(rint(_1565.z)), _402);
    float3 _1574 = float3(_414, _450, float(int(_396)));
    float3 _1576 = select(_1574, float3(0.0), isnan(_1574));
    float _526 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1576.xy, uint(rint(_1576.z)), _402);
    float3 _1585 = float3(_418, _450, float(int(_396)));
    float3 _1587 = select(_1585, float3(0.0), isnan(_1585));
    float _528 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1587.xy, uint(rint(_1587.z)), _402);
    float3 _1596 = float3(_420, _450, float(int(_396)));
    float3 _1598 = select(_1596, float3(0.0), isnan(_1596));
    float _530 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1598.xy, uint(rint(_1598.z)), _402);
    float2 _1604 = float2(_520, _522);
    float _532 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1604, float2(0.0), isnan(_1604))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1604, float2(0.0), isnan(_1604))).x;
    float _534 = _194 * (*spvDescriptorSet0.fp_c3)._m0[14].y;
    float _536 = fma(_184, (*spvDescriptorSet0.fp_c3)._m0[14].x, _534);
    float _538 = fma(_176, (*spvDescriptorSet0.fp_c3)._m0[14].z, _536);
    float _540 = _538 + (*spvDescriptorSet0.fp_c3)._m0[14].w;
    float _542 = precise::min(_540, 1.0);
    float _544 = -_176;
    float _546 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _548 = _544 + _546;
    float _550 = _548 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _552 = precise::clamp(_550, 0.0, 1.0);
    float _554 = _508 + _464;
    float _556 = _554 + _466;
    float _558 = _556 + _468;
    float _560 = _558 + _470;
    float _562 = -_516;
    float _564 = fma(_562, _516, _518);
    float _566 = -_516;
    float _568 = _542 + _566;
    float _570 = fma(_568, _568, _564);
    bool _572 = _568 <= 0.001000000047497451305389404296875;
    float _574 = float(_572);
    float _576 = _560 + _524;
    float _578 = 1.0 / _570;
    float _580 = _576 + _526;
    float _582 = _580 + _528;
    float _584 = -_176;
    float _586 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _588 = _584 + _586;
    float _590 = _564 * _578;
    float _592 = _582 + _530;
    float _594 = _588 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _596 = precise::clamp(_594, 0.0, 1.0);
    float _598 = precise::max(_590, _574);
    float _600 = fma(_592, 0.0625, _552);
    float _602 = precise::min(_598, 1.0);
    float _604 = _602 + _596;
    out.m_49.x = _532;
    out.m_49.y = _600;
    out.m_49.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_49.w = _604;
    return out;
}

