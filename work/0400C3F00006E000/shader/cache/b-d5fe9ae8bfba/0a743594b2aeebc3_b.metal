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
    bool _270 = false;
    bool _268 = false;
    float _54 = in.m_38.x;
    float _56 = in.m_38.y;
    float2 _596 = float2(_54, _56);
    float3 _60 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_596, float2(0.0), isnan(_596)), int2(0), component::x).xyw;
    float _62 = _60.x;
    float _64 = _60.y;
    float _66 = _60.z;
    float2 _613 = float2(_54, _56);
    float _68 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_613, float2(0.0), isnan(_613))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_613, float2(0.0), isnan(_613))).x;
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
    float _170 = _162 * _162;
    float _172 = -_68;
    float _174 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _176 = fma(_172, (*spvDescriptorSet0.fp_c3)._m0[46].z, _174);
    float _178 = -_164;
    float _180 = fma(_144, _152, _178);
    float _182 = fma(_168, _168, _170);
    float _184 = _176 * _70;
    float _186 = -_176;
    bool _190 = _186 > (*spvDescriptorSet0.fp_c3)._m0[40].x;
    float _192 = fma(_180, _180, _182);
    float _194 = -_176;
    bool _196 = _194 > (*spvDescriptorSet0.fp_c3)._m0[39].x;
    float _198 = _176 * _72;
    bool _200 = !_190;
    uint _203 = uint(_200 ? 0 : 1);
    float _205 = rsqrt(_192);
    uint _207 = 2u;
    if (!_190)
    {
        _207 = 1u;
    }
    uint _209 = _207;
    uint _211 = _209;
    if (!_196)
    {
        _211 = _203;
    }
    uint _213 = _211;
    uint _215 = min(_213, 2u);
    float _217 = _162 * _205;
    float _219 = _168 * _205;
    float _221 = _180 * _205;
    int _224 = int(_215) << 2;
    float _226 = _217 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    uint _228 = uint(int(uint(_224) >> uint(2)));
    uint _230 = uint(int(uint(int(_228)) >> uint(2)));
    int _232 = int(_228) & 3;
    float _234 = (*spvDescriptorSet0.fp_c1)._m0[int(_230)][_232];
    float _236 = fma(_219, (*spvDescriptorSet0.fp_c3)._m0[35].x, _226);
    float _238 = fma(_221, (*spvDescriptorSet0.fp_c3)._m0[35].z, _236);
    float _240 = abs(_238);
    float _242 = -_240;
    float _244 = _242 + 1.0;
    float _246 = precise::clamp(_244, 0.0, 1.0);
    float _248 = abs(_246);
    float _250 = log2(_248);
    float _252 = _250 * (*spvDescriptorSet0.fp_c3)._m0[48].z;
    float _254 = exp2(_252);
    float _256 = _254 * (*spvDescriptorSet0.fp_c3)._m0[48].y;
    float _258 = fma(_219, _256, _198);
    float _260 = fma(_217, _256, _184);
    float _262 = fma(_221, _256, _176);
    bool _264 = as_type<int>(_234) == 1216;
    if (!_264)
    {
        bool _266 = as_type<int>(_234) == 1488;
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
            _306 = _300;
            _308 = _296;
            _310 = _298;
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
            _306 = _340;
            _308 = _336;
            _310 = _338;
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
            _306 = _372;
            _308 = _368;
            _310 = _370;
        }
    }
    float _376 = _304;
    float _378 = _306;
    float _380 = _308;
    float _382 = _310;
    float _384 = 1.0 / _376;
    float _386 = float(int(_213));
    float _388 = rint(_386);
    float _390 = precise::max(_388, 0.0);
    uint _392 = uint(_390);
    uint _394 = clamp(_392, 0u, 65535u);
    float _396 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _398 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _400 = _384 * _378;
    float _402 = precise::clamp(_400, 0.0, 1.0);
    float _404 = _384 * _380;
    float _406 = _384 * _382;
    float _408 = _402 * _396;
    float _410 = _402 * _398;
    float _412 = fma(_408, 0.5, _404);
    float _414 = fma(_410, 0.5, _406);
    float _416 = fma(_410, 1.5, _406);
    float _418 = fma(_408, -0.5, _404);
    float _420 = fma(_408, 1.5, _404);
    float3 _1268 = float3(_412, _416, float(int(_394)));
    float3 _1272 = select(_1268, float3(0.0), isnan(_1268));
    float _422 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1272.xy, uint(rint(_1272.z)), _402);
    float3 _1281 = float3(_418, _416, float(int(_394)));
    float3 _1283 = select(_1281, float3(0.0), isnan(_1281));
    float _424 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1283.xy, uint(rint(_1283.z)), _402);
    float3 _1292 = float3(_420, _414, float(int(_394)));
    float3 _1294 = select(_1292, float3(0.0), isnan(_1292));
    float _426 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1294.xy, uint(rint(_1294.z)), _402);
    float3 _1303 = float3(_412, _414, float(int(_394)));
    float3 _1305 = select(_1303, float3(0.0), isnan(_1303));
    float _428 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1305.xy, uint(rint(_1305.z)), _402);
    float3 _1314 = float3(_418, _414, float(int(_394)));
    float3 _1316 = select(_1314, float3(0.0), isnan(_1314));
    float _430 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1316.xy, uint(rint(_1316.z)), _402);
    float _432 = fma(_408, -1.5, _404);
    float _434 = fma(_410, -0.5, _406);
    float3 _1332 = float3(_432, _414, float(int(_394)));
    float3 _1334 = select(_1332, float3(0.0), isnan(_1332));
    float _436 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1334.xy, uint(rint(_1334.z)), _402);
    float3 _1343 = float3(_412, _434, float(int(_394)));
    float3 _1345 = select(_1343, float3(0.0), isnan(_1343));
    float _438 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1345.xy, uint(rint(_1345.z)), _402);
    float3 _1354 = float3(_432, _416, float(int(_394)));
    float3 _1356 = select(_1354, float3(0.0), isnan(_1354));
    float _440 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1356.xy, uint(rint(_1356.z)), _402);
    float3 _1365 = float3(_420, _416, float(int(_394)));
    float3 _1367 = select(_1365, float3(0.0), isnan(_1365));
    float _442 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1367.xy, uint(rint(_1367.z)), _402);
    float3 _1376 = float3(_420, _434, float(int(_394)));
    float3 _1378 = select(_1376, float3(0.0), isnan(_1376));
    float _444 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1378.xy, uint(rint(_1378.z)), _402);
    float3 _1387 = float3(_418, _434, float(int(_394)));
    float3 _1389 = select(_1387, float3(0.0), isnan(_1387));
    float _446 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1389.xy, uint(rint(_1389.z)), _402);
    float3 _1398 = float3(_432, _434, float(int(_394)));
    float3 _1400 = select(_1398, float3(0.0), isnan(_1398));
    float _448 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1400.xy, uint(rint(_1400.z)), _402);
    float _450 = fma(_410, -1.5, _406);
    float _452 = _184 * (*spvDescriptorSet0.fp_c3)._m0[15].y;
    float _454 = _184 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
    float _456 = fma(_198, (*spvDescriptorSet0.fp_c3)._m0[15].x, _452);
    float _458 = _184 * (*spvDescriptorSet0.fp_c3)._m0[12].y;
    float _460 = fma(_198, (*spvDescriptorSet0.fp_c3)._m0[13].x, _454);
    float _462 = fma(_176, (*spvDescriptorSet0.fp_c3)._m0[15].z, _456);
    float _464 = fma(_198, (*spvDescriptorSet0.fp_c3)._m0[12].x, _458);
    float _466 = fma(_176, (*spvDescriptorSet0.fp_c3)._m0[13].z, _460);
    float _468 = _462 + (*spvDescriptorSet0.fp_c3)._m0[15].w;
    float _470 = fma(_176, (*spvDescriptorSet0.fp_c3)._m0[12].z, _464);
    float _472 = _466 + (*spvDescriptorSet0.fp_c3)._m0[13].w;
    float _474 = 1.0 / _468;
    float _476 = _470 + (*spvDescriptorSet0.fp_c3)._m0[12].w;
    float _478 = _476 * _474;
    float _480 = _472 * _474;
    float2 _1474 = float2(_478, _480);
    float2 _484 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_1474, float2(0.0), isnan(_1474))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_1474, float2(0.0), isnan(_1474))).xy;
    float _486 = _484.x;
    float _488 = _484.y;
    float3 _1489 = float3(_420, _450, float(int(_394)));
    float3 _1491 = select(_1489, float3(0.0), isnan(_1489));
    float _490 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1491.xy, uint(rint(_1491.z)), _402);
    float3 _1500 = float3(_412, _450, float(int(_394)));
    float3 _1502 = select(_1500, float3(0.0), isnan(_1500));
    float _492 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1502.xy, uint(rint(_1502.z)), _402);
    float3 _1511 = float3(_418, _450, float(int(_394)));
    float3 _1513 = select(_1511, float3(0.0), isnan(_1511));
    float _494 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1513.xy, uint(rint(_1513.z)), _402);
    float3 _1522 = float3(_432, _450, float(int(_394)));
    float3 _1524 = select(_1522, float3(0.0), isnan(_1522));
    float _496 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1524.xy, uint(rint(_1524.z)), _402);
    float2 _1530 = float2(_54, _56);
    float _498 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1530, float2(0.0), isnan(_1530))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1530, float2(0.0), isnan(_1530))).x;
    float _500 = _184 * (*spvDescriptorSet0.fp_c3)._m0[14].y;
    float _502 = fma(_198, (*spvDescriptorSet0.fp_c3)._m0[14].x, _500);
    float _504 = fma(_176, (*spvDescriptorSet0.fp_c3)._m0[14].z, _502);
    float _506 = _504 + (*spvDescriptorSet0.fp_c3)._m0[14].w;
    float _508 = precise::min(_506, 1.0);
    float _510 = _442 + _422;
    float _512 = _510 + _424;
    float _514 = _512 + _440;
    float _516 = _514 + _426;
    float _518 = _516 + _428;
    float _520 = _518 + _430;
    float _522 = _520 + _436;
    float _524 = _522 + _444;
    float _526 = _524 + _438;
    float _528 = _526 + _446;
    float _530 = _528 + _448;
    float _532 = -_486;
    float _534 = fma(_532, _486, _488);
    float _536 = -_486;
    float _538 = _508 + _536;
    float _540 = _530 + _490;
    float _542 = fma(_538, _538, _534);
    float _544 = _540 + _492;
    bool _546 = _538 <= 0.001000000047497451305389404296875;
    float _548 = float(_546);
    float _550 = 1.0 / _542;
    float _552 = _544 + _494;
    float _554 = -_176;
    float _556 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _558 = _554 + _556;
    float _560 = _552 + _496;
    float _562 = _558 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _564 = precise::clamp(_562, 0.0, 1.0);
    float _566 = _534 * _550;
    float _568 = -_176;
    float _570 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _572 = _568 + _570;
    float _574 = precise::max(_566, _548);
    float _576 = _572 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _578 = precise::clamp(_576, 0.0, 1.0);
    float _580 = precise::min(_574, 1.0);
    float _582 = fma(_560, 0.0625, _578);
    float _584 = _580 + _564;
    out.m_47.x = _498;
    out.m_47.y = _582;
    out.m_47.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_47.w = _584;
    return out;
}

