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
    texture2d<float> fp_t_tcb_C [[id(4)]];
    sampler fp_t_tcb_CSmplr [[id(5)]];
    texture2d_array<float> fp_t_tcb_E [[id(6)]];
    sampler fp_t_tcb_ESmplr [[id(7)]];
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
    bool _282 = false;
    bool _280 = false;
    float _56 = in.m_40.x;
    float _58 = in.m_40.y;
    float2 _590 = float2(_56, _58);
    float3 _62 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_590, float2(0.0), isnan(_590)), int2(0), component::x).xyw;
    float _64 = _62.x;
    float _66 = _62.y;
    float _68 = _62.z;
    float2 _607 = float2(_56, _58);
    float _70 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_607, float2(0.0), isnan(_607))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_607, float2(0.0), isnan(_607))).x;
    float _72 = in.m_42.y;
    float _74 = in.m_44.y;
    float _76 = in.m_42.x;
    float _78 = in.m_46.y;
    float _80 = in.m_44.x;
    float _82 = in.m_46.x;
    float _84 = -_64;
    float _86 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _88 = fma(_84, (*spvDescriptorSet0.fp_c3)._m0[46].z, _86);
    float _90 = -_66;
    float _92 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _94 = fma(_90, (*spvDescriptorSet0.fp_c3)._m0[46].z, _92);
    float _96 = _72 * _88;
    float _98 = _76 * _88;
    float _100 = -_96;
    float _102 = fma(_94, _74, _100);
    float _104 = -_68;
    float _106 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _108 = fma(_104, (*spvDescriptorSet0.fp_c3)._m0[46].z, _106);
    float _110 = -_98;
    float _112 = fma(_94, _80, _110);
    float _114 = -_88;
    float _116 = _114 + _94;
    float _118 = _102 * _102;
    float _120 = -_96;
    float _122 = fma(_108, _78, _120);
    float _124 = -_98;
    float _126 = fma(_108, _82, _124);
    float _128 = -_88;
    float _130 = _128 + _108;
    float _132 = fma(_112, _112, _118);
    float _134 = _122 * _122;
    float _136 = fma(_116, _116, _132);
    float _138 = fma(_126, _126, _134);
    float _140 = fma(_130, _130, _138);
    float _142 = rsqrt(_136);
    float _144 = rsqrt(_140);
    float _146 = _112 * _142;
    float _148 = _116 * _142;
    float _150 = _102 * _142;
    float _152 = _130 * _144;
    float _154 = _122 * _144;
    float _156 = _126 * _144;
    float _158 = -_70;
    float _160 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _162 = fma(_158, (*spvDescriptorSet0.fp_c3)._m0[46].z, _160);
    float _164 = _146 * _152;
    float _166 = _148 * _154;
    float _168 = _162 * _76;
    float _170 = -_164;
    float _172 = fma(_148, _156, _170);
    float _174 = _150 * _156;
    float _176 = -_166;
    float _178 = fma(_150, _152, _176);
    float _180 = -_162;
    bool _184 = _180 > (*spvDescriptorSet0.fp_c3)._m0[40].x;
    float _186 = _172 * _172;
    float _188 = -_174;
    float _190 = fma(_146, _154, _188);
    float _192 = -_162;
    bool _194 = _192 > (*spvDescriptorSet0.fp_c3)._m0[39].x;
    float _196 = _162 * _72;
    float _198 = fma(_178, _178, _186);
    float _200 = -_162;
    bool _202 = _200 > (*spvDescriptorSet0.fp_c3)._m0[41].x;
    bool _204 = !_184;
    int _207 = _204 ? 0 : 1;
    float _209 = fma(_190, _190, _198);
    int _211 = 2;
    if (!_184)
    {
        _211 = 1;
    }
    int _213 = _211;
    float _215 = rsqrt(_209);
    int _217 = _213;
    if (!_194)
    {
        _217 = _207;
    }
    int _219 = _217;
    int _221 = _219 + 1;
    uint _224 = uint(_221);
    if (!_202)
    {
        _224 = uint(_219);
    }
    uint _226 = _224;
    uint _228 = min(_226, 2u);
    int _230 = int(_228) << 2;
    float _232 = _172 * _215;
    float _234 = _178 * _215;
    float _236 = _190 * _215;
    float _238 = _232 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    uint _240 = uint(int(uint(_230) >> uint(2)));
    uint _242 = uint(int(uint(int(_240)) >> uint(2)));
    int _244 = int(_240) & 3;
    float _246 = (*spvDescriptorSet0.fp_c1)._m0[int(_242)][_244];
    float _248 = fma(_234, (*spvDescriptorSet0.fp_c3)._m0[35].x, _238);
    float _250 = fma(_236, (*spvDescriptorSet0.fp_c3)._m0[35].z, _248);
    float _252 = abs(_250);
    float _254 = -_252;
    float _256 = _254 + 1.0;
    float _258 = precise::clamp(_256, 0.0, 1.0);
    float _260 = abs(_258);
    float _262 = log2(_260);
    float _264 = _262 * (*spvDescriptorSet0.fp_c3)._m0[48].z;
    float _266 = exp2(_264);
    float _268 = _266 * (*spvDescriptorSet0.fp_c3)._m0[48].y;
    float _270 = fma(_234, _268, _168);
    float _272 = fma(_232, _268, _196);
    float _274 = fma(_236, _268, _162);
    bool _276 = as_type<int>(_246) == 1264;
    if (!_276)
    {
        bool _278 = as_type<int>(_246) == 1536;
        _280 = _278;
        if (!_280)
        {
            _282 = true;
        }
    }
    float _316;
    float _318;
    float _320;
    float _322;
    if (!_280)
    {
        if (!_282)
        {
            float _284 = _272 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
            float _286 = _272 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
            float _288 = _272 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _290 = _272 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
            float _292 = fma(_270, (*spvDescriptorSet0.fp_c3)._m0[0].x, _284);
            float _294 = fma(_270, (*spvDescriptorSet0.fp_c3)._m0[1].x, _286);
            float _296 = fma(_270, (*spvDescriptorSet0.fp_c3)._m0[2].x, _288);
            float _298 = fma(_270, (*spvDescriptorSet0.fp_c3)._m0[3].x, _290);
            float _300 = fma(_274, (*spvDescriptorSet0.fp_c3)._m0[0].z, _292);
            float _302 = fma(_274, (*spvDescriptorSet0.fp_c3)._m0[1].z, _294);
            float _304 = fma(_274, (*spvDescriptorSet0.fp_c3)._m0[2].z, _296);
            float _306 = fma(_274, (*spvDescriptorSet0.fp_c3)._m0[3].z, _298);
            float _308 = _300 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
            float _310 = _302 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
            float _312 = _304 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
            float _314 = _306 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
            _316 = _314;
            _318 = _308;
            _320 = _310;
            _322 = _312;
        }
    }
    if ((false || _282) || _280)
    {
        if ((!_282) || _280)
        {
            _280 = false;
            float _324 = _272 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
            float _326 = _272 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
            float _328 = _272 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
            float _330 = _272 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
            float _332 = fma(_270, (*spvDescriptorSet0.fp_c3)._m0[4].x, _324);
            float _334 = fma(_270, (*spvDescriptorSet0.fp_c3)._m0[5].x, _326);
            float _336 = fma(_270, (*spvDescriptorSet0.fp_c3)._m0[6].x, _328);
            float _338 = fma(_270, (*spvDescriptorSet0.fp_c3)._m0[7].x, _330);
            float _340 = fma(_274, (*spvDescriptorSet0.fp_c3)._m0[4].z, _332);
            float _342 = fma(_274, (*spvDescriptorSet0.fp_c3)._m0[5].z, _334);
            float _344 = fma(_274, (*spvDescriptorSet0.fp_c3)._m0[6].z, _336);
            float _346 = fma(_274, (*spvDescriptorSet0.fp_c3)._m0[7].z, _338);
            float _348 = _340 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
            float _350 = _342 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
            float _352 = _344 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
            float _354 = _346 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
            _316 = _354;
            _318 = _348;
            _320 = _350;
            _322 = _352;
        }
        if (false || _282)
        {
            _282 = false;
            float _356 = _272 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
            float _358 = _272 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
            float _360 = _272 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
            float _362 = _272 * (*spvDescriptorSet0.fp_c3)._m0[11].y;
            float _364 = fma(_270, (*spvDescriptorSet0.fp_c3)._m0[8].x, _356);
            float _366 = fma(_270, (*spvDescriptorSet0.fp_c3)._m0[9].x, _358);
            float _368 = fma(_270, (*spvDescriptorSet0.fp_c3)._m0[10].x, _360);
            float _370 = fma(_270, (*spvDescriptorSet0.fp_c3)._m0[11].x, _362);
            float _372 = fma(_274, (*spvDescriptorSet0.fp_c3)._m0[8].z, _364);
            float _374 = fma(_274, (*spvDescriptorSet0.fp_c3)._m0[9].z, _366);
            float _376 = fma(_274, (*spvDescriptorSet0.fp_c3)._m0[10].z, _368);
            float _378 = fma(_274, (*spvDescriptorSet0.fp_c3)._m0[11].z, _370);
            float _380 = _372 + (*spvDescriptorSet0.fp_c3)._m0[8].w;
            float _382 = _374 + (*spvDescriptorSet0.fp_c3)._m0[9].w;
            float _384 = _376 + (*spvDescriptorSet0.fp_c3)._m0[10].w;
            float _386 = _378 + (*spvDescriptorSet0.fp_c3)._m0[11].w;
            _316 = _386;
            _318 = _380;
            _320 = _382;
            _322 = _384;
        }
    }
    float _388 = _316;
    float _390 = _318;
    float _392 = _320;
    float _394 = _322;
    float2 _1213 = float2(_56, _58);
    float2 _398 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_1213, float2(0.0), isnan(_1213))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_1213, float2(0.0), isnan(_1213))).xy;
    float _400 = _398.x;
    float _402 = _398.y;
    float _404 = _196 * (*spvDescriptorSet0.fp_c3)._m0[15].y;
    float _406 = 1.0 / _388;
    float _408 = _196 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
    float _410 = fma(_168, (*spvDescriptorSet0.fp_c3)._m0[15].x, _404);
    float _412 = _196 * (*spvDescriptorSet0.fp_c3)._m0[12].y;
    float _414 = fma(_168, (*spvDescriptorSet0.fp_c3)._m0[13].x, _408);
    float _416 = fma(_162, (*spvDescriptorSet0.fp_c3)._m0[15].z, _410);
    float _418 = fma(_162, (*spvDescriptorSet0.fp_c3)._m0[13].z, _414);
    float _420 = _416 + (*spvDescriptorSet0.fp_c3)._m0[15].w;
    float _422 = fma(_168, (*spvDescriptorSet0.fp_c3)._m0[12].x, _412);
    float _424 = _418 + (*spvDescriptorSet0.fp_c3)._m0[13].w;
    float _426 = fma(_162, (*spvDescriptorSet0.fp_c3)._m0[12].z, _422);
    float _428 = 1.0 / _420;
    float _430 = _406 * _390;
    float _432 = _406 * _392;
    float _434 = _426 + (*spvDescriptorSet0.fp_c3)._m0[12].w;
    float _436 = _406 * _394;
    float _438 = precise::clamp(_436, 0.0, 1.0);
    float _440 = _434 * _428;
    float _442 = float(int(_226));
    float _444 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _446 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _448 = _424 * _428;
    float _450 = rint(_442);
    float _452 = precise::max(_450, 0.0);
    uint _454 = uint(_452);
    uint _456 = clamp(_454, 0u, 65535u);
    float _458 = -_446;
    float _460 = fma(_438, _458, _432);
    float _462 = fma(_402, 2.0, -1.0);
    float _464 = fma(_400, 2.0, -1.0);
    float _466 = fma(_438, _444, _430);
    float _468 = _462 * (*spvDescriptorSet0.fp_c3)._m0[36].w;
    float _470 = _464 * (*spvDescriptorSet0.fp_c3)._m0[36].z;
    float _472 = fma(_468, 2.0, _58);
    float _474 = fma(_470, 2.0, _56);
    float _476 = -_444;
    float _478 = fma(_438, _476, _430);
    float _480 = fma(_438, _446, _432);
    float3 _1372 = float3(_430, _480, float(int(_456)));
    float3 _1376 = select(_1372, float3(0.0), isnan(_1372));
    float _482 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1376.xy, uint(rint(_1376.z)), _438);
    float3 _1385 = float3(_466, _480, float(int(_456)));
    float3 _1387 = select(_1385, float3(0.0), isnan(_1385));
    float _484 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1387.xy, uint(rint(_1387.z)), _438);
    float3 _1396 = float3(_478, _480, float(int(_456)));
    float3 _1398 = select(_1396, float3(0.0), isnan(_1396));
    float _486 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1398.xy, uint(rint(_1398.z)), _438);
    float3 _1407 = float3(_466, _432, float(int(_456)));
    float3 _1409 = select(_1407, float3(0.0), isnan(_1407));
    float _488 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1409.xy, uint(rint(_1409.z)), _438);
    float3 _1418 = float3(_430, _432, float(int(_456)));
    float3 _1420 = select(_1418, float3(0.0), isnan(_1418));
    float _490 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1420.xy, uint(rint(_1420.z)), _438);
    float2 _1426 = float2(_440, _448);
    float2 _492 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_1426, float2(0.0), isnan(_1426))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_1426, float2(0.0), isnan(_1426))).xy;
    float _494 = _492.x;
    float _496 = _492.y;
    float3 _1441 = float3(_478, _432, float(int(_456)));
    float3 _1443 = select(_1441, float3(0.0), isnan(_1441));
    float _498 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1443.xy, uint(rint(_1443.z)), _438);
    float3 _1452 = float3(_466, _460, float(int(_456)));
    float3 _1454 = select(_1452, float3(0.0), isnan(_1452));
    float _500 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1454.xy, uint(rint(_1454.z)), _438);
    float3 _1463 = float3(_430, _460, float(int(_456)));
    float3 _1465 = select(_1463, float3(0.0), isnan(_1463));
    float _502 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1465.xy, uint(rint(_1465.z)), _438);
    float3 _1474 = float3(_478, _460, float(int(_456)));
    float3 _1476 = select(_1474, float3(0.0), isnan(_1474));
    float _504 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1476.xy, uint(rint(_1476.z)), _438);
    float2 _1482 = float2(_474, _472);
    float _506 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1482, float2(0.0), isnan(_1482))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1482, float2(0.0), isnan(_1482))).x;
    float _508 = _196 * (*spvDescriptorSet0.fp_c3)._m0[14].y;
    float _510 = fma(_168, (*spvDescriptorSet0.fp_c3)._m0[14].x, _508);
    float _512 = fma(_162, (*spvDescriptorSet0.fp_c3)._m0[14].z, _510);
    float _514 = _512 + (*spvDescriptorSet0.fp_c3)._m0[14].w;
    float _516 = precise::min(_514, 1.0);
    float _518 = -_162;
    float _520 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _522 = _518 + _520;
    float _524 = _522 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _526 = precise::clamp(_524, 0.0, 1.0);
    float _528 = _484 + _482;
    float _530 = _528 + _486;
    float _532 = -_494;
    float _534 = fma(_532, _494, _496);
    float _536 = -_494;
    float _538 = _516 + _536;
    float _540 = _530 + _488;
    float _542 = fma(_538, _538, _534);
    float _544 = _540 + _490;
    bool _546 = _538 <= 0.001000000047497451305389404296875;
    float _548 = float(_546);
    float _550 = 1.0 / _542;
    float _552 = _544 + _498;
    float _554 = _552 + _500;
    float _556 = _554 + _502;
    float _558 = _556 + _504;
    float _560 = _534 * _550;
    float _562 = -_162;
    float _564 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _566 = _562 + _564;
    float _568 = precise::max(_560, _548);
    float _570 = _566 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _572 = precise::clamp(_570, 0.0, 1.0);
    float _574 = precise::min(_568, 1.0);
    float _576 = fma(_558, 0.111111111938953399658203125, _572);
    float _578 = _574 + _526;
    out.m_49.x = _506;
    out.m_49.y = _576;
    out.m_49.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_49.w = _578;
    return out;
}

