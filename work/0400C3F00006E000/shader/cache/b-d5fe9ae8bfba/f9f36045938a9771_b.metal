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
    texture2d<float> fp_t_tcb_A [[id(8)]];
    sampler fp_t_tcb_ASmplr [[id(9)]];
    sampler fp_t_tcb_8Smplr_w [[id(10)]];
    sampler fp_t_tcb_CSmplr_w [[id(11)]];
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
    bool _280 = false;
    bool _278 = false;
    float _54 = in.m_38.x;
    float _56 = in.m_38.y;
    float2 _556 = float2(_54, _56);
    float3 _60 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_556, float2(0.0), isnan(_556)), int2(0), component::x).xyw;
    float _62 = _60.x;
    float _64 = _60.y;
    float _66 = _60.z;
    float2 _573 = float2(_54, _56);
    float _68 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_573, float2(0.0), isnan(_573))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_573, float2(0.0), isnan(_573))).x;
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
    float _140 = rsqrt(_136);
    float _142 = rsqrt(_138);
    float _144 = _114 * _140;
    float _146 = _126 * _140;
    float _148 = _106 * _140;
    float _150 = _130 * _142;
    float _152 = _110 * _142;
    float _154 = _118 * _142;
    float _156 = _144 * _150;
    float _158 = _146 * _152;
    float _160 = -_156;
    float _162 = fma(_146, _154, _160);
    float _164 = _148 * _154;
    float _166 = -_158;
    float _168 = fma(_148, _150, _166);
    float _170 = -_68;
    float _172 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _174 = fma(_170, (*spvDescriptorSet0.fp_c3)._m0[46].z, _172);
    float _176 = _162 * _162;
    float _178 = -_164;
    float _180 = fma(_144, _152, _178);
    float _182 = fma(_168, _168, _176);
    float _184 = -_174;
    bool _188 = _184 > (*spvDescriptorSet0.fp_c3)._m0[40].x;
    float _190 = -_174;
    bool _192 = _190 > (*spvDescriptorSet0.fp_c3)._m0[39].x;
    float _194 = fma(_180, _180, _182);
    float _196 = -_174;
    bool _198 = _196 > (*spvDescriptorSet0.fp_c3)._m0[41].x;
    bool _200 = !_188;
    int _203 = _200 ? 0 : 1;
    float _205 = rsqrt(_194);
    int _207 = 2;
    if (!_188)
    {
        _207 = 1;
    }
    int _209 = _207;
    int _211 = _209;
    if (!_192)
    {
        _211 = _203;
    }
    int _213 = _211;
    int _215 = _213 + 1;
    uint _218 = uint(_215);
    if (!_198)
    {
        _218 = uint(_213);
    }
    uint _220 = _218;
    float _222 = _162 * _205;
    float _224 = _168 * _205;
    uint _226 = min(_220, 2u);
    float _228 = _180 * _205;
    float _230 = _222 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    int _232 = int(_226) << 2;
    float _234 = fma(_224, (*spvDescriptorSet0.fp_c3)._m0[35].x, _230);
    float _236 = fma(_228, (*spvDescriptorSet0.fp_c3)._m0[35].z, _234);
    uint _238 = uint(int(uint(_232) >> uint(2)));
    uint _240 = uint(int(uint(int(_238)) >> uint(2)));
    int _242 = int(_238) & 3;
    float _244 = (*spvDescriptorSet0.fp_c1)._m0[int(_240)][_242];
    float _246 = abs(_236);
    float _248 = -_246;
    float _250 = _248 + 1.0;
    float _252 = precise::clamp(_250, 0.0, 1.0);
    float _254 = abs(_252);
    float _256 = log2(_254);
    float _258 = _256 * (*spvDescriptorSet0.fp_c3)._m0[48].z;
    float _260 = exp2(_258);
    float _262 = _260 * (*spvDescriptorSet0.fp_c3)._m0[48].y;
    float _264 = _222 * _262;
    float _266 = _224 * _262;
    float _268 = fma(_228, _262, _174);
    float _270 = fma(_174, _70, _264);
    float _272 = fma(_174, _72, _266);
    bool _274 = as_type<int>(_244) == 1264;
    if (!_274)
    {
        bool _276 = as_type<int>(_244) == 1536;
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
            float _290 = fma(_272, (*spvDescriptorSet0.fp_c3)._m0[0].x, _282);
            float _292 = fma(_272, (*spvDescriptorSet0.fp_c3)._m0[1].x, _284);
            float _294 = fma(_272, (*spvDescriptorSet0.fp_c3)._m0[2].x, _286);
            float _296 = fma(_272, (*spvDescriptorSet0.fp_c3)._m0[3].x, _288);
            float _298 = fma(_268, (*spvDescriptorSet0.fp_c3)._m0[0].z, _290);
            float _300 = fma(_268, (*spvDescriptorSet0.fp_c3)._m0[1].z, _292);
            float _302 = fma(_268, (*spvDescriptorSet0.fp_c3)._m0[2].z, _294);
            float _304 = fma(_268, (*spvDescriptorSet0.fp_c3)._m0[3].z, _296);
            float _306 = _298 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
            float _308 = _300 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
            float _310 = _302 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
            float _312 = _304 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
            _314 = _312;
            _316 = _310;
            _318 = _306;
            _320 = _308;
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
            float _330 = fma(_272, (*spvDescriptorSet0.fp_c3)._m0[4].x, _322);
            float _332 = fma(_272, (*spvDescriptorSet0.fp_c3)._m0[5].x, _324);
            float _334 = fma(_272, (*spvDescriptorSet0.fp_c3)._m0[6].x, _326);
            float _336 = fma(_272, (*spvDescriptorSet0.fp_c3)._m0[7].x, _328);
            float _338 = fma(_268, (*spvDescriptorSet0.fp_c3)._m0[4].z, _330);
            float _340 = fma(_268, (*spvDescriptorSet0.fp_c3)._m0[5].z, _332);
            float _342 = fma(_268, (*spvDescriptorSet0.fp_c3)._m0[6].z, _334);
            float _344 = fma(_268, (*spvDescriptorSet0.fp_c3)._m0[7].z, _336);
            float _346 = _338 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
            float _348 = _340 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
            float _350 = _342 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
            float _352 = _344 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
            _314 = _352;
            _316 = _350;
            _318 = _346;
            _320 = _348;
        }
        if (false || _280)
        {
            _280 = false;
            float _354 = _270 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
            float _356 = _270 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
            float _358 = _270 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
            float _360 = _270 * (*spvDescriptorSet0.fp_c3)._m0[11].y;
            float _362 = fma(_272, (*spvDescriptorSet0.fp_c3)._m0[8].x, _354);
            float _364 = fma(_272, (*spvDescriptorSet0.fp_c3)._m0[9].x, _356);
            float _366 = fma(_272, (*spvDescriptorSet0.fp_c3)._m0[10].x, _358);
            float _368 = fma(_272, (*spvDescriptorSet0.fp_c3)._m0[11].x, _360);
            float _370 = fma(_268, (*spvDescriptorSet0.fp_c3)._m0[8].z, _362);
            float _372 = fma(_268, (*spvDescriptorSet0.fp_c3)._m0[9].z, _364);
            float _374 = fma(_268, (*spvDescriptorSet0.fp_c3)._m0[10].z, _366);
            float _376 = fma(_268, (*spvDescriptorSet0.fp_c3)._m0[11].z, _368);
            float _378 = _370 + (*spvDescriptorSet0.fp_c3)._m0[8].w;
            float _380 = _372 + (*spvDescriptorSet0.fp_c3)._m0[9].w;
            float _382 = _374 + (*spvDescriptorSet0.fp_c3)._m0[10].w;
            float _384 = _376 + (*spvDescriptorSet0.fp_c3)._m0[11].w;
            _314 = _384;
            _316 = _382;
            _318 = _378;
            _320 = _380;
        }
    }
    float _386 = _314;
    float _388 = _316;
    float _390 = _318;
    float _392 = _320;
    float _394 = 1.0 / _386;
    float _396 = float(int(_220));
    float _398 = rint(_396);
    float _400 = precise::max(_398, 0.0);
    uint _402 = uint(_400);
    uint _404 = clamp(_402, 0u, 65535u);
    float _406 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _408 = _394 * _388;
    float _410 = precise::clamp(_408, 0.0, 1.0);
    float _412 = _394 * _390;
    float _414 = _394 * _392;
    float _416 = _410 * _406;
    float _418 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _420 = fma(_416, 0.5, _412);
    float _422 = fma(_416, 1.5, _412);
    float _424 = fma(_416, -0.5, _412);
    float _426 = fma(_416, -1.5, _412);
    float _428 = _410 * _418;
    float _430 = fma(_428, 1.5, _414);
    float _432 = fma(_428, 0.5, _414);
    float3 _1248 = float3(_420, _430, float(int(_404)));
    float3 _1252 = select(_1248, float3(0.0), isnan(_1248));
    float _434 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1252.xy, uint(rint(_1252.z)), _410);
    float3 _1261 = float3(_422, _430, float(int(_404)));
    float3 _1263 = select(_1261, float3(0.0), isnan(_1261));
    float _436 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1263.xy, uint(rint(_1263.z)), _410);
    float3 _1272 = float3(_424, _430, float(int(_404)));
    float3 _1274 = select(_1272, float3(0.0), isnan(_1272));
    float _438 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1274.xy, uint(rint(_1274.z)), _410);
    float3 _1283 = float3(_426, _430, float(int(_404)));
    float3 _1285 = select(_1283, float3(0.0), isnan(_1283));
    float _440 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1285.xy, uint(rint(_1285.z)), _410);
    float3 _1294 = float3(_422, _432, float(int(_404)));
    float3 _1296 = select(_1294, float3(0.0), isnan(_1294));
    float _442 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1296.xy, uint(rint(_1296.z)), _410);
    float3 _1305 = float3(_420, _432, float(int(_404)));
    float3 _1307 = select(_1305, float3(0.0), isnan(_1305));
    float _444 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1307.xy, uint(rint(_1307.z)), _410);
    float2 _1313 = float2(_54, _56);
    float2 _448 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_1313, float2(0.0), isnan(_1313))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_1313, float2(0.0), isnan(_1313))).xy;
    float _450 = _448.x;
    float _452 = _448.y;
    float3 _1328 = float3(_424, _432, float(int(_404)));
    float3 _1330 = select(_1328, float3(0.0), isnan(_1328));
    float _454 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1330.xy, uint(rint(_1330.z)), _410);
    float _456 = fma(_428, -0.5, _414);
    float _458 = _436 + _434;
    float _460 = _458 + _438;
    float _462 = _460 + _440;
    float _464 = _462 + _442;
    float3 _1354 = float3(_426, _432, float(int(_404)));
    float3 _1356 = select(_1354, float3(0.0), isnan(_1354));
    float _466 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1356.xy, uint(rint(_1356.z)), _410);
    float3 _1365 = float3(_422, _456, float(int(_404)));
    float3 _1367 = select(_1365, float3(0.0), isnan(_1365));
    float _468 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1367.xy, uint(rint(_1367.z)), _410);
    float3 _1376 = float3(_420, _456, float(int(_404)));
    float3 _1378 = select(_1376, float3(0.0), isnan(_1376));
    float _470 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1378.xy, uint(rint(_1378.z)), _410);
    float3 _1387 = float3(_424, _456, float(int(_404)));
    float3 _1389 = select(_1387, float3(0.0), isnan(_1387));
    float _472 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1389.xy, uint(rint(_1389.z)), _410);
    float _474 = fma(_428, -1.5, _414);
    float _476 = _464 + _444;
    float _478 = fma(_450, 2.0, -1.0);
    float _480 = fma(_452, 2.0, -1.0);
    float _482 = _476 + _454;
    float _484 = _478 * (*spvDescriptorSet0.fp_c3)._m0[36].z;
    float _486 = _480 * (*spvDescriptorSet0.fp_c3)._m0[36].w;
    float _488 = fma(_484, 2.0, _54);
    float _490 = fma(_486, 2.0, _56);
    float3 _1428 = float3(_426, _456, float(int(_404)));
    float3 _1430 = select(_1428, float3(0.0), isnan(_1428));
    float _492 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1430.xy, uint(rint(_1430.z)), _410);
    float3 _1439 = float3(_422, _474, float(int(_404)));
    float3 _1441 = select(_1439, float3(0.0), isnan(_1439));
    float _494 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1441.xy, uint(rint(_1441.z)), _410);
    float3 _1450 = float3(_420, _474, float(int(_404)));
    float3 _1452 = select(_1450, float3(0.0), isnan(_1450));
    float _496 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1452.xy, uint(rint(_1452.z)), _410);
    float3 _1461 = float3(_424, _474, float(int(_404)));
    float3 _1463 = select(_1461, float3(0.0), isnan(_1461));
    float _498 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1463.xy, uint(rint(_1463.z)), _410);
    float3 _1472 = float3(_426, _474, float(int(_404)));
    float3 _1474 = select(_1472, float3(0.0), isnan(_1472));
    float _500 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1474.xy, uint(rint(_1474.z)), _410);
    float2 _1480 = float2(_488, _490);
    float _502 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1480, float2(0.0), isnan(_1480))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1480, float2(0.0), isnan(_1480))).x;
    float _504 = -_174;
    float _506 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _508 = _504 + _506;
    float _510 = _508 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _512 = precise::clamp(_510, 0.0, 1.0);
    float _514 = fma(_260, (*spvDescriptorSet0.fp_c3)._m0[48].w, _512);
    float _516 = _482 + _466;
    float _518 = _516 + _468;
    float _520 = _518 + _470;
    float _522 = _520 + _472;
    float _524 = _522 + _492;
    float _526 = _524 + _494;
    float _528 = -_174;
    float _530 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _532 = _528 + _530;
    float _534 = _526 + _496;
    float _536 = _532 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _538 = precise::clamp(_536, 0.0, 1.0);
    float _540 = _534 + _498;
    float _542 = _540 + _500;
    float _544 = fma(_542, 0.0625, _538);
    out.m_47.x = _502;
    out.m_47.y = _544;
    out.m_47.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_47.w = _514;
    return out;
}

