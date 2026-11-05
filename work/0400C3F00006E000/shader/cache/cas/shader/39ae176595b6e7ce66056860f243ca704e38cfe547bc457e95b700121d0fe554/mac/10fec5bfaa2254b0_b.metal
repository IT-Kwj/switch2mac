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
    bool _282 = false;
    bool _280 = false;
    float _56 = in.m_40.x;
    float _58 = in.m_40.y;
    float2 _542 = float2(_56, _58);
    float3 _62 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_542, float2(0.0), isnan(_542)), int2(0), component::x).xyw;
    float _64 = _62.x;
    float _66 = _62.y;
    float _68 = _62.z;
    float2 _559 = float2(_56, _58);
    float _70 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_559, float2(0.0), isnan(_559))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_559, float2(0.0), isnan(_559))).x;
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
    float _146 = -_70;
    float _148 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _150 = fma(_146, (*spvDescriptorSet0.fp_c3)._m0[46].z, _148);
    float _152 = -_150;
    bool _156 = _152 > (*spvDescriptorSet0.fp_c3)._m0[40].x;
    float _158 = _112 * _142;
    float _160 = _116 * _142;
    float _162 = _102 * _142;
    float _164 = -_150;
    bool _166 = _164 > (*spvDescriptorSet0.fp_c3)._m0[39].x;
    float _168 = -_150;
    bool _170 = _168 > (*spvDescriptorSet0.fp_c3)._m0[41].x;
    float _172 = _130 * _144;
    float _174 = _122 * _144;
    float _176 = _126 * _144;
    float _178 = _158 * _172;
    float _180 = _160 * _174;
    float _182 = -_178;
    float _184 = fma(_160, _176, _182);
    float _186 = _162 * _176;
    float _188 = -_180;
    float _190 = fma(_162, _172, _188);
    float _192 = _184 * _184;
    float _194 = -_186;
    float _196 = fma(_158, _174, _194);
    int _199 = 2;
    if (!_156)
    {
        _199 = 1;
    }
    int _201 = _199;
    float _203 = fma(_190, _190, _192);
    float _205 = fma(_196, _196, _203);
    bool _207 = !_156;
    int _209 = _207 ? 0 : 1;
    int _211 = _201;
    if (!_166)
    {
        _211 = _209;
    }
    int _213 = _211;
    float _215 = rsqrt(_205);
    int _217 = _213 + 1;
    uint _220 = uint(_217);
    if (!_170)
    {
        _220 = uint(_213);
    }
    uint _222 = _220;
    uint _224 = min(_222, 2u);
    int _226 = int(_224) << 2;
    float _228 = _184 * _215;
    float _230 = _190 * _215;
    float _232 = _196 * _215;
    uint _234 = uint(int(uint(_226) >> uint(2)));
    uint _236 = uint(int(uint(int(_234)) >> uint(2)));
    int _238 = int(_234) & 3;
    float _240 = (*spvDescriptorSet0.fp_c1)._m0[int(_236)][_238];
    float _242 = _228 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    float _244 = _150 * _76;
    float _246 = fma(_230, (*spvDescriptorSet0.fp_c3)._m0[35].x, _242);
    float _248 = fma(_232, (*spvDescriptorSet0.fp_c3)._m0[35].z, _246);
    float _250 = abs(_248);
    float _252 = -_250;
    float _254 = _252 + 1.0;
    float _256 = precise::clamp(_254, 0.0, 1.0);
    float _258 = _150 * _72;
    float _260 = abs(_256);
    float _262 = log2(_260);
    float _264 = _262 * (*spvDescriptorSet0.fp_c3)._m0[48].z;
    float _266 = exp2(_264);
    float _268 = _266 * (*spvDescriptorSet0.fp_c3)._m0[48].y;
    float _270 = fma(_230, _268, _244);
    float _272 = fma(_228, _268, _258);
    float _274 = fma(_232, _268, _150);
    bool _276 = as_type<int>(_240) == 1264;
    if (!_276)
    {
        bool _278 = as_type<int>(_240) == 1536;
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
            _318 = _310;
            _320 = _308;
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
            _318 = _350;
            _320 = _348;
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
            _318 = _382;
            _320 = _380;
            _322 = _384;
        }
    }
    float _388 = _316;
    float _390 = _318;
    float _392 = _320;
    float _394 = _322;
    float _396 = _258 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
    float _398 = _258 * (*spvDescriptorSet0.fp_c3)._m0[15].y;
    float _400 = 1.0 / _388;
    float _402 = float(int(_222));
    float _404 = fma(_244, (*spvDescriptorSet0.fp_c3)._m0[13].x, _396);
    float _406 = fma(_244, (*spvDescriptorSet0.fp_c3)._m0[15].x, _398);
    float2 _1190 = float2(_56, _58);
    float2 _410 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_1190, float2(0.0), isnan(_1190))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_1190, float2(0.0), isnan(_1190))).xy;
    float _412 = _410.x;
    float _414 = _410.y;
    float _416 = _258 * (*spvDescriptorSet0.fp_c3)._m0[12].y;
    float _418 = fma(_150, (*spvDescriptorSet0.fp_c3)._m0[13].z, _404);
    float _420 = fma(_150, (*spvDescriptorSet0.fp_c3)._m0[15].z, _406);
    float _422 = rint(_402);
    float _424 = precise::max(_422, 0.0);
    uint _426 = uint(_424);
    uint _428 = clamp(_426, 0u, 65535u);
    float _430 = _418 + (*spvDescriptorSet0.fp_c3)._m0[13].w;
    float _432 = _420 + (*spvDescriptorSet0.fp_c3)._m0[15].w;
    float _434 = fma(_244, (*spvDescriptorSet0.fp_c3)._m0[12].x, _416);
    float _436 = 1.0 / _432;
    float _438 = fma(_150, (*spvDescriptorSet0.fp_c3)._m0[12].z, _434);
    float _440 = _400 * _390;
    float _442 = _400 * _392;
    float _444 = _400 * _394;
    float _446 = precise::clamp(_444, 0.0, 1.0);
    float _448 = _438 + (*spvDescriptorSet0.fp_c3)._m0[12].w;
    float _450 = _448 * _436;
    float _452 = _430 * _436;
    float2 _1268 = float2(_450, _452);
    float2 _454 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_1268, float2(0.0), isnan(_1268))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_1268, float2(0.0), isnan(_1268))).xy;
    float _456 = _454.x;
    float _458 = _454.y;
    float3 _1283 = float3(_442, _440, float(int(_428)));
    float3 _1287 = select(_1283, float3(0.0), isnan(_1283));
    float _460 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1287.xy, uint(rint(_1287.z)), _446);
    float _462 = fma(_412, 2.0, -1.0);
    float _464 = fma(_414, 2.0, -1.0);
    float _466 = _462 * (*spvDescriptorSet0.fp_c3)._m0[36].z;
    float _468 = _464 * (*spvDescriptorSet0.fp_c3)._m0[36].w;
    float _470 = fma(_466, 2.0, _56);
    float _472 = fma(_468, 2.0, _58);
    float2 _1314 = float2(_470, _472);
    float _474 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1314, float2(0.0), isnan(_1314))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1314, float2(0.0), isnan(_1314))).x;
    float _476 = _258 * (*spvDescriptorSet0.fp_c3)._m0[14].y;
    float _478 = -_150;
    float _480 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _482 = _478 + _480;
    float _484 = fma(_244, (*spvDescriptorSet0.fp_c3)._m0[14].x, _476);
    float _486 = -_456;
    float _488 = fma(_486, _456, _458);
    float _490 = fma(_150, (*spvDescriptorSet0.fp_c3)._m0[14].z, _484);
    float _492 = -_150;
    float _494 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _496 = _492 + _494;
    float _498 = _482 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _500 = precise::clamp(_498, 0.0, 1.0);
    float _502 = _490 + (*spvDescriptorSet0.fp_c3)._m0[14].w;
    float _504 = _496 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _506 = precise::clamp(_504, 0.0, 1.0);
    float _508 = _460 + _500;
    float _510 = precise::min(_502, 1.0);
    float _512 = -_456;
    float _514 = _510 + _512;
    float _516 = fma(_514, _514, _488);
    bool _518 = _514 <= 0.001000000047497451305389404296875;
    float _520 = float(_518);
    float _522 = 1.0 / _516;
    float _524 = _488 * _522;
    float _526 = precise::max(_524, _520);
    float _528 = precise::min(_526, 1.0);
    float _530 = _528 + _506;
    out.m_49.x = _474;
    out.m_49.y = _508;
    out.m_49.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_49.w = _530;
    return out;
}

