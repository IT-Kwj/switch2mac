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
    bool _270 = false;
    bool _268 = false;
    float _54 = in.m_38.x;
    float _56 = in.m_38.y;
    float2 _546 = float2(_54, _56);
    float3 _60 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_546, float2(0.0), isnan(_546)), int2(0), component::x).xyw;
    float _62 = _60.x;
    float _64 = _60.y;
    float _66 = _60.z;
    float2 _563 = float2(_54, _56);
    float _68 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_563, float2(0.0), isnan(_563))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_563, float2(0.0), isnan(_563))).x;
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
    float _172 = -_164;
    float _174 = fma(_144, _152, _172);
    float _176 = -_68;
    float _178 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _180 = fma(_176, (*spvDescriptorSet0.fp_c3)._m0[46].z, _178);
    float _182 = fma(_168, _168, _170);
    float _184 = -_180;
    bool _188 = _184 > (*spvDescriptorSet0.fp_c3)._m0[40].x;
    float _190 = fma(_174, _174, _182);
    float _192 = -_180;
    bool _194 = _192 > (*spvDescriptorSet0.fp_c3)._m0[39].x;
    bool _196 = !_188;
    uint _199 = uint(_196 ? 0 : 1);
    float _201 = rsqrt(_190);
    uint _203 = 2u;
    if (!_188)
    {
        _203 = 1u;
    }
    uint _205 = _203;
    uint _207 = _205;
    if (!_194)
    {
        _207 = _199;
    }
    uint _209 = _207;
    uint _211 = min(_209, 2u);
    float _213 = _162 * _201;
    float _215 = _168 * _201;
    float _217 = _174 * _201;
    int _220 = int(_211) << 2;
    float _222 = _213 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    float _224 = fma(_215, (*spvDescriptorSet0.fp_c3)._m0[35].x, _222);
    float _226 = fma(_217, (*spvDescriptorSet0.fp_c3)._m0[35].z, _224);
    uint _228 = uint(int(uint(_220) >> uint(2)));
    uint _230 = uint(int(uint(int(_228)) >> uint(2)));
    int _232 = int(_228) & 3;
    float _234 = (*spvDescriptorSet0.fp_c1)._m0[int(_230)][_232];
    float _236 = abs(_226);
    float _238 = -_236;
    float _240 = _238 + 1.0;
    float _242 = precise::clamp(_240, 0.0, 1.0);
    float _244 = abs(_242);
    float _246 = log2(_244);
    float _248 = _246 * (*spvDescriptorSet0.fp_c3)._m0[48].z;
    float _250 = exp2(_248);
    float _252 = _250 * (*spvDescriptorSet0.fp_c3)._m0[48].y;
    float _254 = _213 * _252;
    float _256 = _215 * _252;
    float _258 = fma(_217, _252, _180);
    float _260 = fma(_180, _70, _254);
    float _262 = fma(_180, _72, _256);
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
            float _280 = fma(_262, (*spvDescriptorSet0.fp_c3)._m0[0].x, _272);
            float _282 = fma(_262, (*spvDescriptorSet0.fp_c3)._m0[1].x, _274);
            float _284 = fma(_262, (*spvDescriptorSet0.fp_c3)._m0[2].x, _276);
            float _286 = fma(_262, (*spvDescriptorSet0.fp_c3)._m0[3].x, _278);
            float _288 = fma(_258, (*spvDescriptorSet0.fp_c3)._m0[0].z, _280);
            float _290 = fma(_258, (*spvDescriptorSet0.fp_c3)._m0[1].z, _282);
            float _292 = fma(_258, (*spvDescriptorSet0.fp_c3)._m0[2].z, _284);
            float _294 = fma(_258, (*spvDescriptorSet0.fp_c3)._m0[3].z, _286);
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
            float _320 = fma(_262, (*spvDescriptorSet0.fp_c3)._m0[4].x, _312);
            float _322 = fma(_262, (*spvDescriptorSet0.fp_c3)._m0[5].x, _314);
            float _324 = fma(_262, (*spvDescriptorSet0.fp_c3)._m0[6].x, _316);
            float _326 = fma(_262, (*spvDescriptorSet0.fp_c3)._m0[7].x, _318);
            float _328 = fma(_258, (*spvDescriptorSet0.fp_c3)._m0[4].z, _320);
            float _330 = fma(_258, (*spvDescriptorSet0.fp_c3)._m0[5].z, _322);
            float _332 = fma(_258, (*spvDescriptorSet0.fp_c3)._m0[6].z, _324);
            float _334 = fma(_258, (*spvDescriptorSet0.fp_c3)._m0[7].z, _326);
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
            float _352 = fma(_262, (*spvDescriptorSet0.fp_c3)._m0[8].x, _344);
            float _354 = fma(_262, (*spvDescriptorSet0.fp_c3)._m0[9].x, _346);
            float _356 = fma(_262, (*spvDescriptorSet0.fp_c3)._m0[10].x, _348);
            float _358 = fma(_262, (*spvDescriptorSet0.fp_c3)._m0[11].x, _350);
            float _360 = fma(_258, (*spvDescriptorSet0.fp_c3)._m0[8].z, _352);
            float _362 = fma(_258, (*spvDescriptorSet0.fp_c3)._m0[9].z, _354);
            float _364 = fma(_258, (*spvDescriptorSet0.fp_c3)._m0[10].z, _356);
            float _366 = fma(_258, (*spvDescriptorSet0.fp_c3)._m0[11].z, _358);
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
    float _386 = float(int(_209));
    float _388 = rint(_386);
    float _390 = precise::max(_388, 0.0);
    uint _392 = uint(_390);
    uint _394 = clamp(_392, 0u, 65535u);
    float _396 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _398 = _384 * _378;
    float _400 = precise::clamp(_398, 0.0, 1.0);
    float _402 = _384 * _380;
    float _404 = _384 * _382;
    float _406 = _400 * _396;
    float _408 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _410 = fma(_406, 0.5, _402);
    float _412 = fma(_406, 1.5, _402);
    float _414 = fma(_406, -0.5, _402);
    float _416 = fma(_406, -1.5, _402);
    float _418 = _400 * _408;
    float _420 = fma(_418, 1.5, _404);
    float _422 = fma(_418, 0.5, _404);
    float3 _1222 = float3(_410, _420, float(int(_394)));
    float3 _1226 = select(_1222, float3(0.0), isnan(_1222));
    float _424 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1226.xy, uint(rint(_1226.z)), _400);
    float3 _1235 = float3(_412, _420, float(int(_394)));
    float3 _1237 = select(_1235, float3(0.0), isnan(_1235));
    float _426 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1237.xy, uint(rint(_1237.z)), _400);
    float3 _1246 = float3(_414, _420, float(int(_394)));
    float3 _1248 = select(_1246, float3(0.0), isnan(_1246));
    float _428 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1248.xy, uint(rint(_1248.z)), _400);
    float3 _1257 = float3(_416, _420, float(int(_394)));
    float3 _1259 = select(_1257, float3(0.0), isnan(_1257));
    float _430 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1259.xy, uint(rint(_1259.z)), _400);
    float3 _1268 = float3(_412, _422, float(int(_394)));
    float3 _1270 = select(_1268, float3(0.0), isnan(_1268));
    float _432 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1270.xy, uint(rint(_1270.z)), _400);
    float3 _1279 = float3(_410, _422, float(int(_394)));
    float3 _1281 = select(_1279, float3(0.0), isnan(_1279));
    float _434 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1281.xy, uint(rint(_1281.z)), _400);
    float2 _1287 = float2(_54, _56);
    float2 _438 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_1287, float2(0.0), isnan(_1287))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_1287, float2(0.0), isnan(_1287))).xy;
    float _440 = _438.x;
    float _442 = _438.y;
    float3 _1302 = float3(_414, _422, float(int(_394)));
    float3 _1304 = select(_1302, float3(0.0), isnan(_1302));
    float _444 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1304.xy, uint(rint(_1304.z)), _400);
    float _446 = fma(_418, -0.5, _404);
    float _448 = _426 + _424;
    float _450 = _448 + _428;
    float _452 = _450 + _430;
    float _454 = _452 + _432;
    float3 _1328 = float3(_416, _422, float(int(_394)));
    float3 _1330 = select(_1328, float3(0.0), isnan(_1328));
    float _456 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1330.xy, uint(rint(_1330.z)), _400);
    float3 _1339 = float3(_412, _446, float(int(_394)));
    float3 _1341 = select(_1339, float3(0.0), isnan(_1339));
    float _458 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1341.xy, uint(rint(_1341.z)), _400);
    float3 _1350 = float3(_410, _446, float(int(_394)));
    float3 _1352 = select(_1350, float3(0.0), isnan(_1350));
    float _460 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1352.xy, uint(rint(_1352.z)), _400);
    float3 _1361 = float3(_414, _446, float(int(_394)));
    float3 _1363 = select(_1361, float3(0.0), isnan(_1361));
    float _462 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1363.xy, uint(rint(_1363.z)), _400);
    float _464 = fma(_418, -1.5, _404);
    float _466 = _454 + _434;
    float _468 = fma(_440, 2.0, -1.0);
    float _470 = fma(_442, 2.0, -1.0);
    float _472 = _466 + _444;
    float _474 = _468 * (*spvDescriptorSet0.fp_c3)._m0[36].z;
    float _476 = _470 * (*spvDescriptorSet0.fp_c3)._m0[36].w;
    float _478 = fma(_474, 2.0, _54);
    float _480 = fma(_476, 2.0, _56);
    float3 _1402 = float3(_416, _446, float(int(_394)));
    float3 _1404 = select(_1402, float3(0.0), isnan(_1402));
    float _482 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1404.xy, uint(rint(_1404.z)), _400);
    float3 _1413 = float3(_412, _464, float(int(_394)));
    float3 _1415 = select(_1413, float3(0.0), isnan(_1413));
    float _484 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1415.xy, uint(rint(_1415.z)), _400);
    float3 _1424 = float3(_410, _464, float(int(_394)));
    float3 _1426 = select(_1424, float3(0.0), isnan(_1424));
    float _486 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1426.xy, uint(rint(_1426.z)), _400);
    float3 _1435 = float3(_414, _464, float(int(_394)));
    float3 _1437 = select(_1435, float3(0.0), isnan(_1435));
    float _488 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1437.xy, uint(rint(_1437.z)), _400);
    float3 _1446 = float3(_416, _464, float(int(_394)));
    float3 _1448 = select(_1446, float3(0.0), isnan(_1446));
    float _490 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1448.xy, uint(rint(_1448.z)), _400);
    float2 _1454 = float2(_478, _480);
    float _492 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1454, float2(0.0), isnan(_1454))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1454, float2(0.0), isnan(_1454))).x;
    float _494 = -_180;
    float _496 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _498 = _494 + _496;
    float _500 = _498 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _502 = precise::clamp(_500, 0.0, 1.0);
    float _504 = fma(_250, (*spvDescriptorSet0.fp_c3)._m0[48].w, _502);
    float _506 = _472 + _456;
    float _508 = _506 + _458;
    float _510 = _508 + _460;
    float _512 = _510 + _462;
    float _514 = _512 + _482;
    float _516 = _514 + _484;
    float _518 = -_180;
    float _520 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _522 = _518 + _520;
    float _524 = _516 + _486;
    float _526 = _522 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _528 = precise::clamp(_526, 0.0, 1.0);
    float _530 = _524 + _488;
    float _532 = _530 + _490;
    float _534 = fma(_532, 0.0625, _528);
    out.m_47.x = _492;
    out.m_47.y = _534;
    out.m_47.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_47.w = _504;
    return out;
}

