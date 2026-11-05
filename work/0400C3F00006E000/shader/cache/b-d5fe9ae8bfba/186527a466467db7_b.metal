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
    bool _280 = false;
    bool _278 = false;
    float _54 = in.m_38.x;
    float _56 = in.m_38.y;
    float2 _606 = float2(_54, _56);
    float3 _60 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_606, float2(0.0), isnan(_606)), int2(0), component::x).xyw;
    float _62 = _60.x;
    float _64 = _60.y;
    float _66 = _60.z;
    float2 _623 = float2(_54, _56);
    float _68 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_623, float2(0.0), isnan(_623))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_623, float2(0.0), isnan(_623))).x;
    float _70 = in.m_40.y;
    float _72 = in.m_42.y;
    float _74 = in.m_40.x;
    float _76 = in.m_44.y;
    float _78 = in.m_42.x;
    float _80 = in.m_44.x;
    float _82 = -_62;
    float _84 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _86 = fma(_82, (*spvDescriptorSet0.fp_c3)._m0[46].z, _84);
    float _88 = -_64;
    float _90 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _92 = fma(_88, (*spvDescriptorSet0.fp_c3)._m0[46].z, _90);
    float _94 = _70 * _86;
    float _96 = _74 * _86;
    float _98 = -_94;
    float _100 = fma(_92, _72, _98);
    float _102 = -_66;
    float _104 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _106 = fma(_102, (*spvDescriptorSet0.fp_c3)._m0[46].z, _104);
    float _108 = -_96;
    float _110 = fma(_92, _78, _108);
    float _112 = -_86;
    float _114 = _112 + _92;
    float _116 = _100 * _100;
    float _118 = -_94;
    float _120 = fma(_106, _76, _118);
    float _122 = -_96;
    float _124 = fma(_106, _80, _122);
    float _126 = -_86;
    float _128 = _126 + _106;
    float _130 = fma(_110, _110, _116);
    float _132 = _120 * _120;
    float _134 = -_68;
    float _136 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _138 = fma(_134, (*spvDescriptorSet0.fp_c3)._m0[46].z, _136);
    float _140 = fma(_114, _114, _130);
    float _142 = fma(_124, _124, _132);
    float _144 = _138 * _70;
    float _146 = -_138;
    bool _150 = _146 > (*spvDescriptorSet0.fp_c3)._m0[40].x;
    float _152 = _138 * _74;
    float _154 = fma(_128, _128, _142);
    float _156 = rsqrt(_140);
    float _158 = -_138;
    bool _160 = _158 > (*spvDescriptorSet0.fp_c3)._m0[39].x;
    float _162 = -_138;
    bool _164 = _162 > (*spvDescriptorSet0.fp_c3)._m0[41].x;
    float _166 = rsqrt(_154);
    int _169 = 2;
    if (!_150)
    {
        _169 = 1;
    }
    int _171 = _169;
    float _173 = _110 * _156;
    float _175 = _114 * _156;
    float _177 = _100 * _156;
    float _179 = _128 * _166;
    float _181 = _120 * _166;
    float _183 = _124 * _166;
    float _185 = _173 * _179;
    float _187 = _175 * _181;
    float _189 = _177 * _183;
    float _191 = -_185;
    float _193 = fma(_175, _183, _191);
    float _195 = -_187;
    float _197 = fma(_177, _179, _195);
    float _199 = -_189;
    float _201 = fma(_173, _181, _199);
    float _203 = _193 * _193;
    float _205 = fma(_197, _197, _203);
    bool _207 = !_150;
    int _209 = _207 ? 0 : 1;
    float _211 = fma(_201, _201, _205);
    int _213 = _171;
    if (!_160)
    {
        _213 = _209;
    }
    int _215 = _213;
    float _217 = rsqrt(_211);
    int _219 = _215 + 1;
    uint _222 = uint(_219);
    if (!_164)
    {
        _222 = uint(_215);
    }
    uint _224 = _222;
    uint _226 = min(_224, 2u);
    int _228 = int(_226) << 2;
    float _230 = _193 * _217;
    float _232 = _197 * _217;
    float _234 = _201 * _217;
    float _236 = _230 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    uint _238 = uint(int(uint(_228) >> uint(2)));
    uint _240 = uint(int(uint(int(_238)) >> uint(2)));
    int _242 = int(_238) & 3;
    float _244 = (*spvDescriptorSet0.fp_c1)._m0[int(_240)][_242];
    float _246 = fma(_232, (*spvDescriptorSet0.fp_c3)._m0[35].x, _236);
    float _248 = fma(_234, (*spvDescriptorSet0.fp_c3)._m0[35].z, _246);
    float _250 = abs(_248);
    float _252 = -_250;
    float _254 = _252 + 1.0;
    float _256 = precise::clamp(_254, 0.0, 1.0);
    float _258 = abs(_256);
    float _260 = log2(_258);
    float _262 = _260 * (*spvDescriptorSet0.fp_c3)._m0[48].z;
    float _264 = exp2(_262);
    float _266 = _264 * (*spvDescriptorSet0.fp_c3)._m0[48].y;
    float _268 = fma(_232, _266, _152);
    float _270 = fma(_230, _266, _144);
    float _272 = fma(_234, _266, _138);
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
    float _396 = float(int(_224));
    float _398 = rint(_396);
    float _400 = precise::max(_398, 0.0);
    uint _402 = uint(_400);
    uint _404 = clamp(_402, 0u, 65535u);
    float _406 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _408 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _410 = _394 * _388;
    float _412 = precise::clamp(_410, 0.0, 1.0);
    float _414 = _394 * _390;
    float _416 = _394 * _392;
    float _418 = _412 * _406;
    float _420 = _412 * _408;
    float _422 = fma(_418, 0.5, _414);
    float _424 = fma(_420, 0.5, _416);
    float _426 = fma(_420, 1.5, _416);
    float _428 = fma(_418, -0.5, _414);
    float _430 = fma(_418, 1.5, _414);
    float3 _1294 = float3(_422, _426, float(int(_404)));
    float3 _1298 = select(_1294, float3(0.0), isnan(_1294));
    float _432 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1298.xy, uint(rint(_1298.z)), _412);
    float3 _1307 = float3(_428, _426, float(int(_404)));
    float3 _1309 = select(_1307, float3(0.0), isnan(_1307));
    float _434 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1309.xy, uint(rint(_1309.z)), _412);
    float3 _1318 = float3(_430, _424, float(int(_404)));
    float3 _1320 = select(_1318, float3(0.0), isnan(_1318));
    float _436 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1320.xy, uint(rint(_1320.z)), _412);
    float3 _1329 = float3(_422, _424, float(int(_404)));
    float3 _1331 = select(_1329, float3(0.0), isnan(_1329));
    float _438 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1331.xy, uint(rint(_1331.z)), _412);
    float3 _1340 = float3(_428, _424, float(int(_404)));
    float3 _1342 = select(_1340, float3(0.0), isnan(_1340));
    float _440 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1342.xy, uint(rint(_1342.z)), _412);
    float _442 = fma(_418, -1.5, _414);
    float _444 = fma(_420, -0.5, _416);
    float3 _1358 = float3(_442, _424, float(int(_404)));
    float3 _1360 = select(_1358, float3(0.0), isnan(_1358));
    float _446 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1360.xy, uint(rint(_1360.z)), _412);
    float3 _1369 = float3(_422, _444, float(int(_404)));
    float3 _1371 = select(_1369, float3(0.0), isnan(_1369));
    float _448 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1371.xy, uint(rint(_1371.z)), _412);
    float3 _1380 = float3(_442, _426, float(int(_404)));
    float3 _1382 = select(_1380, float3(0.0), isnan(_1380));
    float _450 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1382.xy, uint(rint(_1382.z)), _412);
    float3 _1391 = float3(_430, _426, float(int(_404)));
    float3 _1393 = select(_1391, float3(0.0), isnan(_1391));
    float _452 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1393.xy, uint(rint(_1393.z)), _412);
    float3 _1402 = float3(_430, _444, float(int(_404)));
    float3 _1404 = select(_1402, float3(0.0), isnan(_1402));
    float _454 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1404.xy, uint(rint(_1404.z)), _412);
    float3 _1413 = float3(_428, _444, float(int(_404)));
    float3 _1415 = select(_1413, float3(0.0), isnan(_1413));
    float _456 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1415.xy, uint(rint(_1415.z)), _412);
    float3 _1424 = float3(_442, _444, float(int(_404)));
    float3 _1426 = select(_1424, float3(0.0), isnan(_1424));
    float _458 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1426.xy, uint(rint(_1426.z)), _412);
    float _460 = fma(_420, -1.5, _416);
    float _462 = _144 * (*spvDescriptorSet0.fp_c3)._m0[15].y;
    float _464 = _144 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
    float _466 = fma(_152, (*spvDescriptorSet0.fp_c3)._m0[15].x, _462);
    float _468 = _144 * (*spvDescriptorSet0.fp_c3)._m0[12].y;
    float _470 = fma(_152, (*spvDescriptorSet0.fp_c3)._m0[13].x, _464);
    float _472 = fma(_138, (*spvDescriptorSet0.fp_c3)._m0[15].z, _466);
    float _474 = fma(_152, (*spvDescriptorSet0.fp_c3)._m0[12].x, _468);
    float _476 = fma(_138, (*spvDescriptorSet0.fp_c3)._m0[13].z, _470);
    float _478 = _472 + (*spvDescriptorSet0.fp_c3)._m0[15].w;
    float _480 = fma(_138, (*spvDescriptorSet0.fp_c3)._m0[12].z, _474);
    float _482 = _476 + (*spvDescriptorSet0.fp_c3)._m0[13].w;
    float _484 = 1.0 / _478;
    float _486 = _480 + (*spvDescriptorSet0.fp_c3)._m0[12].w;
    float _488 = _486 * _484;
    float _490 = _482 * _484;
    float2 _1500 = float2(_488, _490);
    float2 _494 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_1500, float2(0.0), isnan(_1500))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_1500, float2(0.0), isnan(_1500))).xy;
    float _496 = _494.x;
    float _498 = _494.y;
    float3 _1515 = float3(_430, _460, float(int(_404)));
    float3 _1517 = select(_1515, float3(0.0), isnan(_1515));
    float _500 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1517.xy, uint(rint(_1517.z)), _412);
    float3 _1526 = float3(_422, _460, float(int(_404)));
    float3 _1528 = select(_1526, float3(0.0), isnan(_1526));
    float _502 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1528.xy, uint(rint(_1528.z)), _412);
    float3 _1537 = float3(_428, _460, float(int(_404)));
    float3 _1539 = select(_1537, float3(0.0), isnan(_1537));
    float _504 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1539.xy, uint(rint(_1539.z)), _412);
    float3 _1548 = float3(_442, _460, float(int(_404)));
    float3 _1550 = select(_1548, float3(0.0), isnan(_1548));
    float _506 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1550.xy, uint(rint(_1550.z)), _412);
    float2 _1556 = float2(_54, _56);
    float _508 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1556, float2(0.0), isnan(_1556))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1556, float2(0.0), isnan(_1556))).x;
    float _510 = _144 * (*spvDescriptorSet0.fp_c3)._m0[14].y;
    float _512 = fma(_152, (*spvDescriptorSet0.fp_c3)._m0[14].x, _510);
    float _514 = fma(_138, (*spvDescriptorSet0.fp_c3)._m0[14].z, _512);
    float _516 = _514 + (*spvDescriptorSet0.fp_c3)._m0[14].w;
    float _518 = precise::min(_516, 1.0);
    float _520 = _452 + _432;
    float _522 = _520 + _434;
    float _524 = _522 + _450;
    float _526 = _524 + _436;
    float _528 = _526 + _438;
    float _530 = _528 + _440;
    float _532 = _530 + _446;
    float _534 = _532 + _454;
    float _536 = _534 + _448;
    float _538 = _536 + _456;
    float _540 = _538 + _458;
    float _542 = -_496;
    float _544 = fma(_542, _496, _498);
    float _546 = -_496;
    float _548 = _518 + _546;
    float _550 = _540 + _500;
    float _552 = fma(_548, _548, _544);
    float _554 = _550 + _502;
    bool _556 = _548 <= 0.001000000047497451305389404296875;
    float _558 = float(_556);
    float _560 = 1.0 / _552;
    float _562 = _554 + _504;
    float _564 = -_138;
    float _566 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _568 = _564 + _566;
    float _570 = _562 + _506;
    float _572 = _568 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _574 = precise::clamp(_572, 0.0, 1.0);
    float _576 = _544 * _560;
    float _578 = -_138;
    float _580 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _582 = _578 + _580;
    float _584 = precise::max(_576, _558);
    float _586 = _582 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _588 = precise::clamp(_586, 0.0, 1.0);
    float _590 = precise::min(_584, 1.0);
    float _592 = fma(_570, 0.0625, _588);
    float _594 = _590 + _574;
    out.m_47.x = _508;
    out.m_47.y = _592;
    out.m_47.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_47.w = _594;
    return out;
}

