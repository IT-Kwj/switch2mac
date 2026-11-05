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
    texture2d<float> fp_t_tcb_10 [[id(6)]];
    sampler fp_t_tcb_10Smplr [[id(7)]];
    texture2d_array<float> fp_t_tcb_E [[id(8)]];
    sampler fp_t_tcb_ESmplr [[id(9)]];
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
    bool _298 = false;
    bool _296 = false;
    float _56 = in.m_40.x;
    float _58 = in.m_40.y;
    float2 _558 = float2(_56, _58);
    float3 _62 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_558, float2(0.0), isnan(_558)), int2(0), component::x).xyw;
    float _64 = _62.x;
    float _66 = _62.y;
    float _68 = _62.z;
    float2 _575 = float2(_56, _58);
    float _70 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_575, float2(0.0), isnan(_575))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_575, float2(0.0), isnan(_575))).x;
    float _72 = in.m_42.y;
    float _74 = in.m_44.y;
    float _76 = in.m_42.x;
    float _78 = in.m_46.y;
    float _80 = in.m_44.x;
    float _82 = in.m_46.x;
    float _84 = -_64;
    float _86 = fma(_84, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _88 = -_66;
    float _90 = fma(_88, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _92 = -_68;
    float _94 = fma(_92, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _96 = 1.0 / _86;
    float _98 = 1.0 / _90;
    float _100 = 1.0 / _94;
    float _102 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _104 = _96 * _102;
    float _106 = _72 * _104;
    float _108 = _76 * _104;
    float _110 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _112 = _98 * _110;
    float _114 = -_106;
    float _116 = fma(_112, _74, _114);
    float _118 = -_108;
    float _120 = fma(_112, _80, _118);
    float _122 = -_104;
    float _124 = _122 + _112;
    float _126 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _128 = _100 * _126;
    float _130 = _116 * _116;
    float _132 = -_106;
    float _134 = fma(_128, _78, _132);
    float _136 = -_108;
    float _138 = fma(_128, _82, _136);
    float _140 = fma(_120, _120, _130);
    float _142 = -_104;
    float _144 = _142 + _128;
    float _146 = _134 * _134;
    float _148 = fma(_124, _124, _140);
    float _150 = fma(_138, _138, _146);
    float _152 = fma(_144, _144, _150);
    float _154 = rsqrt(_148);
    float _156 = rsqrt(_152);
    float _158 = -_70;
    float _160 = fma(_158, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _162 = 1.0 / _160;
    float _164 = _120 * _154;
    float _166 = _124 * _154;
    float _168 = _116 * _154;
    float _170 = _144 * _156;
    float _172 = _134 * _156;
    float _174 = _138 * _156;
    float _176 = _164 * _170;
    float _178 = _166 * _172;
    float _180 = -_176;
    float _182 = fma(_166, _174, _180);
    float _184 = _168 * _174;
    float _186 = -_178;
    float _188 = fma(_168, _170, _186);
    float _190 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _192 = _162 * _190;
    float _194 = _182 * _182;
    float _196 = -_184;
    float _198 = fma(_164, _172, _196);
    float _200 = _192 * _76;
    float _202 = fma(_188, _188, _194);
    float _204 = -_192;
    bool _208 = _204 > (*spvDescriptorSet0.fp_c3)._m0[40].x;
    float _210 = -_192;
    bool _212 = _210 > (*spvDescriptorSet0.fp_c3)._m0[39].x;
    float _214 = fma(_198, _198, _202);
    float _216 = -_192;
    bool _218 = _216 > (*spvDescriptorSet0.fp_c3)._m0[41].x;
    bool _220 = !_208;
    int _223 = _220 ? 0 : 1;
    float _225 = rsqrt(_214);
    int _227 = 2;
    if (!_208)
    {
        _227 = 1;
    }
    int _229 = _227;
    int _231 = _229;
    if (!_212)
    {
        _231 = _223;
    }
    int _233 = _231;
    int _235 = _233 + 1;
    uint _238 = uint(_235);
    if (!_218)
    {
        _238 = uint(_233);
    }
    uint _240 = _238;
    float _242 = _182 * _225;
    uint _244 = min(_240, 2u);
    float _246 = _188 * _225;
    float _248 = _198 * _225;
    float _250 = _242 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    int _252 = int(_244) << 2;
    float _254 = fma(_246, (*spvDescriptorSet0.fp_c3)._m0[35].x, _250);
    uint _256 = uint(int(uint(_252) >> uint(2)));
    uint _258 = uint(int(uint(int(_256)) >> uint(2)));
    int _260 = int(_256) & 3;
    float _262 = (*spvDescriptorSet0.fp_c1)._m0[int(_258)][_260];
    float _264 = fma(_248, (*spvDescriptorSet0.fp_c3)._m0[35].z, _254);
    float _266 = abs(_264);
    float _268 = -_266;
    float _270 = _268 + 1.0;
    float _272 = precise::clamp(_270, 0.0, 1.0);
    float _274 = _192 * _72;
    float _276 = abs(_272);
    float _278 = log2(_276);
    float _280 = _278 * (*spvDescriptorSet0.fp_c3)._m0[48].z;
    float _282 = exp2(_280);
    float _284 = _282 * (*spvDescriptorSet0.fp_c3)._m0[48].y;
    float _286 = fma(_246, _284, _200);
    float _288 = fma(_242, _284, _274);
    float _290 = fma(_248, _284, _192);
    bool _292 = as_type<int>(_262) == 1392;
    if (!_292)
    {
        bool _294 = as_type<int>(_262) == 1664;
        _296 = _294;
        if (!_296)
        {
            _298 = true;
        }
    }
    float _332;
    float _334;
    float _336;
    float _338;
    if (!_296)
    {
        if (!_298)
        {
            float _300 = _288 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
            float _302 = _288 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
            float _304 = _288 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _306 = _288 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
            float _308 = fma(_286, (*spvDescriptorSet0.fp_c3)._m0[0].x, _300);
            float _310 = fma(_286, (*spvDescriptorSet0.fp_c3)._m0[1].x, _302);
            float _312 = fma(_286, (*spvDescriptorSet0.fp_c3)._m0[2].x, _304);
            float _314 = fma(_286, (*spvDescriptorSet0.fp_c3)._m0[3].x, _306);
            float _316 = fma(_290, (*spvDescriptorSet0.fp_c3)._m0[0].z, _308);
            float _318 = fma(_290, (*spvDescriptorSet0.fp_c3)._m0[1].z, _310);
            float _320 = fma(_290, (*spvDescriptorSet0.fp_c3)._m0[2].z, _312);
            float _322 = fma(_290, (*spvDescriptorSet0.fp_c3)._m0[3].z, _314);
            float _324 = _316 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
            float _326 = _318 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
            float _328 = _320 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
            float _330 = _322 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
            _332 = _330;
            _334 = _326;
            _336 = _324;
            _338 = _328;
        }
    }
    if ((false || _298) || _296)
    {
        if ((!_298) || _296)
        {
            _296 = false;
            float _340 = _288 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
            float _342 = _288 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
            float _344 = _288 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
            float _346 = _288 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
            float _348 = fma(_286, (*spvDescriptorSet0.fp_c3)._m0[4].x, _340);
            float _350 = fma(_286, (*spvDescriptorSet0.fp_c3)._m0[5].x, _342);
            float _352 = fma(_286, (*spvDescriptorSet0.fp_c3)._m0[6].x, _344);
            float _354 = fma(_286, (*spvDescriptorSet0.fp_c3)._m0[7].x, _346);
            float _356 = fma(_290, (*spvDescriptorSet0.fp_c3)._m0[4].z, _348);
            float _358 = fma(_290, (*spvDescriptorSet0.fp_c3)._m0[5].z, _350);
            float _360 = fma(_290, (*spvDescriptorSet0.fp_c3)._m0[6].z, _352);
            float _362 = fma(_290, (*spvDescriptorSet0.fp_c3)._m0[7].z, _354);
            float _364 = _356 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
            float _366 = _358 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
            float _368 = _360 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
            float _370 = _362 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
            _332 = _370;
            _334 = _366;
            _336 = _364;
            _338 = _368;
        }
        if (false || _298)
        {
            _298 = false;
            float _372 = _288 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
            float _374 = _288 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
            float _376 = _288 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
            float _378 = _288 * (*spvDescriptorSet0.fp_c3)._m0[11].y;
            float _380 = fma(_286, (*spvDescriptorSet0.fp_c3)._m0[8].x, _372);
            float _382 = fma(_286, (*spvDescriptorSet0.fp_c3)._m0[9].x, _374);
            float _384 = fma(_286, (*spvDescriptorSet0.fp_c3)._m0[10].x, _376);
            float _386 = fma(_286, (*spvDescriptorSet0.fp_c3)._m0[11].x, _378);
            float _388 = fma(_290, (*spvDescriptorSet0.fp_c3)._m0[8].z, _380);
            float _390 = fma(_290, (*spvDescriptorSet0.fp_c3)._m0[9].z, _382);
            float _392 = fma(_290, (*spvDescriptorSet0.fp_c3)._m0[10].z, _384);
            float _394 = fma(_290, (*spvDescriptorSet0.fp_c3)._m0[11].z, _386);
            float _396 = _388 + (*spvDescriptorSet0.fp_c3)._m0[8].w;
            float _398 = _390 + (*spvDescriptorSet0.fp_c3)._m0[9].w;
            float _400 = _392 + (*spvDescriptorSet0.fp_c3)._m0[10].w;
            float _402 = _394 + (*spvDescriptorSet0.fp_c3)._m0[11].w;
            _332 = _402;
            _334 = _398;
            _336 = _396;
            _338 = _400;
        }
    }
    float _404 = _332;
    float _406 = _334;
    float _408 = _336;
    float _410 = _338;
    float _412 = _274 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
    float _414 = _274 * (*spvDescriptorSet0.fp_c3)._m0[15].y;
    float _416 = 1.0 / _404;
    float _418 = float(int(_240));
    float _420 = fma(_200, (*spvDescriptorSet0.fp_c3)._m0[13].x, _412);
    float _422 = fma(_200, (*spvDescriptorSet0.fp_c3)._m0[15].x, _414);
    float2 _1222 = float2(_56, _58);
    float2 _426 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_1222, float2(0.0), isnan(_1222))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_1222, float2(0.0), isnan(_1222))).xy;
    float _428 = _426.x;
    float _430 = _426.y;
    float _432 = _274 * (*spvDescriptorSet0.fp_c3)._m0[12].y;
    float _434 = fma(_192, (*spvDescriptorSet0.fp_c3)._m0[13].z, _420);
    float _436 = fma(_192, (*spvDescriptorSet0.fp_c3)._m0[15].z, _422);
    float _438 = rint(_418);
    float _440 = precise::max(_438, 0.0);
    uint _442 = uint(_440);
    uint _444 = clamp(_442, 0u, 65535u);
    float _446 = _434 + (*spvDescriptorSet0.fp_c3)._m0[13].w;
    float _448 = _436 + (*spvDescriptorSet0.fp_c3)._m0[15].w;
    float _450 = fma(_200, (*spvDescriptorSet0.fp_c3)._m0[12].x, _432);
    float _452 = 1.0 / _448;
    float _454 = fma(_192, (*spvDescriptorSet0.fp_c3)._m0[12].z, _450);
    float _456 = _416 * _406;
    float _458 = _416 * _408;
    float _460 = _416 * _410;
    float _462 = precise::clamp(_460, 0.0, 1.0);
    float _464 = _454 + (*spvDescriptorSet0.fp_c3)._m0[12].w;
    float _466 = _464 * _452;
    float _468 = _446 * _452;
    float2 _1300 = float2(_466, _468);
    float2 _470 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_1300, float2(0.0), isnan(_1300))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_1300, float2(0.0), isnan(_1300))).xy;
    float _472 = _470.x;
    float _474 = _470.y;
    float3 _1315 = float3(_458, _456, float(int(_444)));
    float3 _1319 = select(_1315, float3(0.0), isnan(_1315));
    float _476 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1319.xy, uint(rint(_1319.z)), _462);
    float _478 = fma(_428, 2.0, -1.0);
    float _480 = fma(_430, 2.0, -1.0);
    float _482 = _478 * (*spvDescriptorSet0.fp_c3)._m0[36].z;
    float _484 = _480 * (*spvDescriptorSet0.fp_c3)._m0[36].w;
    float _486 = fma(_482, 2.0, _56);
    float _488 = fma(_484, 2.0, _58);
    float2 _1346 = float2(_486, _488);
    float _490 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1346, float2(0.0), isnan(_1346))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1346, float2(0.0), isnan(_1346))).x;
    float _492 = _274 * (*spvDescriptorSet0.fp_c3)._m0[14].y;
    float _494 = -_192;
    float _496 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _498 = _494 + _496;
    float _500 = fma(_200, (*spvDescriptorSet0.fp_c3)._m0[14].x, _492);
    float _502 = -_472;
    float _504 = fma(_502, _472, _474);
    float _506 = fma(_192, (*spvDescriptorSet0.fp_c3)._m0[14].z, _500);
    float _508 = -_192;
    float _510 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _512 = _508 + _510;
    float _514 = _498 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _516 = precise::clamp(_514, 0.0, 1.0);
    float _518 = _506 + (*spvDescriptorSet0.fp_c3)._m0[14].w;
    float _520 = _512 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _522 = precise::clamp(_520, 0.0, 1.0);
    float _524 = _476 + _516;
    float _526 = precise::min(_518, 1.0);
    float _528 = -_472;
    float _530 = _526 + _528;
    float _532 = fma(_530, _530, _504);
    bool _534 = _530 <= 0.001000000047497451305389404296875;
    float _536 = float(_534);
    float _538 = 1.0 / _532;
    float _540 = _504 * _538;
    float _542 = precise::max(_540, _536);
    float _544 = precise::min(_542, 1.0);
    float _546 = _544 + _522;
    out.m_49.x = _490;
    out.m_49.y = _524;
    out.m_49.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_49.w = _546;
    return out;
}

