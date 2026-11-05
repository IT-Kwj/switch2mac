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
    texture2d_array<float> fp_t_tcb_A [[id(6)]];
    sampler fp_t_tcb_ASmplr [[id(7)]];
    sampler fp_t_tcb_8Smplr_w [[id(8)]];
    sampler fp_t_tcb_CSmplr_w [[id(9)]];
    constant dm_border_t* dm_border [[id(10)]];
};

struct main0_out
{
    float4 m_45 [[color(0)]];
};

struct main0_in
{
    float4 m_38 [[user(locn0), center_no_perspective]];
    float4 m_42 [[user(locn1), center_no_perspective]];
    float4 m_40 [[user(locn2), center_no_perspective]];
    float4 m_36 [[user(locn3), center_no_perspective]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    bool _278 = false;
    bool _276 = false;
    float _52 = in.m_36.x;
    float _54 = in.m_36.y;
    float2 _544 = float2(_52, _54);
    float3 _58 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_544, float2(0.0), isnan(_544)), int2(0), component::x).xyw;
    float _60 = _58.x;
    float _62 = _58.y;
    float _64 = _58.z;
    float2 _561 = float2(_52, _54);
    float _66 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_561, float2(0.0), isnan(_561))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_561, float2(0.0), isnan(_561))).x;
    float _68 = in.m_38.y;
    float _70 = in.m_38.x;
    float _72 = in.m_40.y;
    float _74 = in.m_42.y;
    float _76 = in.m_40.x;
    float _78 = in.m_42.x;
    float _80 = -_60;
    float _82 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _84 = fma(_80, (*spvDescriptorSet0.fp_c3)._m0[46].z, _82);
    float _86 = -_62;
    float _88 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _90 = fma(_86, (*spvDescriptorSet0.fp_c3)._m0[46].z, _88);
    float _92 = -_64;
    float _94 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _96 = fma(_92, (*spvDescriptorSet0.fp_c3)._m0[46].z, _94);
    float _98 = _68 * _84;
    float _100 = _70 * _84;
    float _102 = -_98;
    float _104 = fma(_90, _72, _102);
    float _106 = -_98;
    float _108 = fma(_96, _74, _106);
    float _110 = -_100;
    float _112 = fma(_90, _76, _110);
    float _114 = -_100;
    float _116 = fma(_96, _78, _114);
    float _118 = _104 * _104;
    float _120 = _108 * _108;
    float _122 = -_84;
    float _124 = _122 + _90;
    float _126 = -_84;
    float _128 = _126 + _96;
    float _130 = fma(_112, _112, _118);
    float _132 = fma(_116, _116, _120);
    float _134 = fma(_124, _124, _130);
    float _136 = fma(_128, _128, _132);
    float _138 = -_66;
    float _140 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _142 = fma(_138, (*spvDescriptorSet0.fp_c3)._m0[46].z, _140);
    float _144 = rsqrt(_134);
    float _146 = -_142;
    bool _150 = _146 > (*spvDescriptorSet0.fp_c3)._m0[40].x;
    float _152 = _142 * _70;
    float _154 = -_142;
    bool _156 = _154 > (*spvDescriptorSet0.fp_c3)._m0[39].x;
    float _158 = _142 * _68;
    float _160 = -_142;
    bool _162 = _160 > (*spvDescriptorSet0.fp_c3)._m0[41].x;
    float _164 = rsqrt(_136);
    float _166 = _112 * _144;
    float _168 = _124 * _144;
    float _170 = _104 * _144;
    float _172 = _128 * _164;
    float _174 = _108 * _164;
    float _176 = _116 * _164;
    float _178 = _166 * _172;
    float _180 = _168 * _174;
    float _182 = _170 * _176;
    float _184 = -_178;
    float _186 = fma(_168, _176, _184);
    float _188 = -_180;
    float _190 = fma(_170, _172, _188);
    float _192 = -_182;
    float _194 = fma(_166, _174, _192);
    float _196 = _186 * _186;
    float _198 = fma(_190, _190, _196);
    int _201 = 2;
    if (!_150)
    {
        _201 = 1;
    }
    int _203 = _201;
    float _205 = fma(_194, _194, _198);
    bool _207 = !_150;
    int _209 = _207 ? 0 : 1;
    int _211 = _203;
    if (!_156)
    {
        _211 = _209;
    }
    int _213 = _211;
    float _215 = rsqrt(_205);
    int _217 = _213 + 1;
    uint _220 = uint(_217);
    if (!_162)
    {
        _220 = uint(_213);
    }
    uint _222 = _220;
    uint _224 = min(_222, 2u);
    int _226 = int(_224) << 2;
    float _228 = _186 * _215;
    float _230 = _190 * _215;
    float _232 = _194 * _215;
    uint _234 = uint(int(uint(_226) >> uint(2)));
    uint _236 = uint(int(uint(int(_234)) >> uint(2)));
    int _238 = int(_234) & 3;
    float _240 = (*spvDescriptorSet0.fp_c1)._m0[int(_236)][_238];
    float _242 = _228 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    float _244 = fma(_230, (*spvDescriptorSet0.fp_c3)._m0[35].x, _242);
    float _246 = fma(_232, (*spvDescriptorSet0.fp_c3)._m0[35].z, _244);
    float _248 = abs(_246);
    float _250 = -_248;
    float _252 = _250 + 1.0;
    float _254 = precise::clamp(_252, 0.0, 1.0);
    float _256 = abs(_254);
    float _258 = log2(_256);
    float _260 = _258 * (*spvDescriptorSet0.fp_c3)._m0[48].z;
    float _262 = exp2(_260);
    float _264 = _262 * (*spvDescriptorSet0.fp_c3)._m0[48].y;
    float _266 = fma(_230, _264, _152);
    float _268 = fma(_228, _264, _158);
    float _270 = fma(_232, _264, _142);
    bool _272 = as_type<int>(_240) == 1264;
    if (!_272)
    {
        bool _274 = as_type<int>(_240) == 1536;
        _276 = _274;
        if (!_276)
        {
            _278 = true;
        }
    }
    float _312;
    float _314;
    float _316;
    float _318;
    if (!_276)
    {
        if (!_278)
        {
            float _280 = _268 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
            float _282 = _268 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
            float _284 = _268 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _286 = _268 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
            float _288 = fma(_266, (*spvDescriptorSet0.fp_c3)._m0[0].x, _280);
            float _290 = fma(_266, (*spvDescriptorSet0.fp_c3)._m0[1].x, _282);
            float _292 = fma(_266, (*spvDescriptorSet0.fp_c3)._m0[2].x, _284);
            float _294 = fma(_266, (*spvDescriptorSet0.fp_c3)._m0[3].x, _286);
            float _296 = fma(_270, (*spvDescriptorSet0.fp_c3)._m0[0].z, _288);
            float _298 = fma(_270, (*spvDescriptorSet0.fp_c3)._m0[1].z, _290);
            float _300 = fma(_270, (*spvDescriptorSet0.fp_c3)._m0[2].z, _292);
            float _302 = fma(_270, (*spvDescriptorSet0.fp_c3)._m0[3].z, _294);
            float _304 = _296 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
            float _306 = _298 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
            float _308 = _300 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
            float _310 = _302 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
            _312 = _310;
            _314 = _308;
            _316 = _306;
            _318 = _304;
        }
    }
    if ((false || _278) || _276)
    {
        if ((!_278) || _276)
        {
            _276 = false;
            float _320 = _268 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
            float _322 = _268 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
            float _324 = _268 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
            float _326 = _268 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
            float _328 = fma(_266, (*spvDescriptorSet0.fp_c3)._m0[4].x, _320);
            float _330 = fma(_266, (*spvDescriptorSet0.fp_c3)._m0[5].x, _322);
            float _332 = fma(_266, (*spvDescriptorSet0.fp_c3)._m0[6].x, _324);
            float _334 = fma(_266, (*spvDescriptorSet0.fp_c3)._m0[7].x, _326);
            float _336 = fma(_270, (*spvDescriptorSet0.fp_c3)._m0[4].z, _328);
            float _338 = fma(_270, (*spvDescriptorSet0.fp_c3)._m0[5].z, _330);
            float _340 = fma(_270, (*spvDescriptorSet0.fp_c3)._m0[6].z, _332);
            float _342 = fma(_270, (*spvDescriptorSet0.fp_c3)._m0[7].z, _334);
            float _344 = _336 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
            float _346 = _338 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
            float _348 = _340 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
            float _350 = _342 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
            _312 = _350;
            _314 = _348;
            _316 = _346;
            _318 = _344;
        }
        if (false || _278)
        {
            _278 = false;
            float _352 = _268 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
            float _354 = _268 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
            float _356 = _268 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
            float _358 = _268 * (*spvDescriptorSet0.fp_c3)._m0[11].y;
            float _360 = fma(_266, (*spvDescriptorSet0.fp_c3)._m0[8].x, _352);
            float _362 = fma(_266, (*spvDescriptorSet0.fp_c3)._m0[9].x, _354);
            float _364 = fma(_266, (*spvDescriptorSet0.fp_c3)._m0[10].x, _356);
            float _366 = fma(_266, (*spvDescriptorSet0.fp_c3)._m0[11].x, _358);
            float _368 = fma(_270, (*spvDescriptorSet0.fp_c3)._m0[8].z, _360);
            float _370 = fma(_270, (*spvDescriptorSet0.fp_c3)._m0[9].z, _362);
            float _372 = fma(_270, (*spvDescriptorSet0.fp_c3)._m0[10].z, _364);
            float _374 = fma(_270, (*spvDescriptorSet0.fp_c3)._m0[11].z, _366);
            float _376 = _368 + (*spvDescriptorSet0.fp_c3)._m0[8].w;
            float _378 = _370 + (*spvDescriptorSet0.fp_c3)._m0[9].w;
            float _380 = _372 + (*spvDescriptorSet0.fp_c3)._m0[10].w;
            float _382 = _374 + (*spvDescriptorSet0.fp_c3)._m0[11].w;
            _312 = _382;
            _314 = _380;
            _316 = _378;
            _318 = _376;
        }
    }
    float _384 = _312;
    float _386 = _314;
    float _388 = _316;
    float _390 = _318;
    float _392 = _158 * (*spvDescriptorSet0.fp_c3)._m0[15].y;
    float _394 = 1.0 / _384;
    float _396 = _158 * (*spvDescriptorSet0.fp_c3)._m0[12].y;
    float _398 = _158 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
    float _400 = fma(_152, (*spvDescriptorSet0.fp_c3)._m0[15].x, _392);
    float _402 = float(int(_222));
    float _404 = fma(_152, (*spvDescriptorSet0.fp_c3)._m0[12].x, _396);
    float _406 = fma(_142, (*spvDescriptorSet0.fp_c3)._m0[15].z, _400);
    float _408 = fma(_142, (*spvDescriptorSet0.fp_c3)._m0[12].z, _404);
    float _410 = rint(_402);
    float _412 = precise::max(_410, 0.0);
    uint _414 = uint(_412);
    uint _416 = clamp(_414, 0u, 65535u);
    float _418 = _406 + (*spvDescriptorSet0.fp_c3)._m0[15].w;
    float _420 = fma(_152, (*spvDescriptorSet0.fp_c3)._m0[13].x, _398);
    float _422 = _408 + (*spvDescriptorSet0.fp_c3)._m0[12].w;
    float _424 = _394 * _386;
    float _426 = precise::clamp(_424, 0.0, 1.0);
    float _428 = fma(_142, (*spvDescriptorSet0.fp_c3)._m0[13].z, _420);
    float _430 = 1.0 / _418;
    float _432 = _394 * _388;
    float _434 = _426 * (*spvDescriptorSet0.fp_c3)._m0[47].x;
    float _436 = _428 + (*spvDescriptorSet0.fp_c3)._m0[13].w;
    float _438 = _394 * _390;
    float _440 = _434 * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _442 = _434 * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _444 = fma(_442, -0.5, _432);
    float _446 = _422 * _430;
    float _448 = _436 * _430;
    float _450 = fma(_440, 0.5, _438);
    float _452 = fma(_440, -0.5, _438);
    float _454 = fma(_442, 0.5, _432);
    float2 _1286 = float2(_446, _448);
    float2 _458 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_1286, float2(0.0), isnan(_1286))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_1286, float2(0.0), isnan(_1286))).xy;
    float _460 = _458.x;
    float _462 = _458.y;
    float3 _1301 = float3(_452, _454, float(int(_416)));
    float3 _1305 = select(_1301, float3(0.0), isnan(_1301));
    float _464 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1305.xy, uint(rint(_1305.z)), _426);
    float3 _1314 = float3(_450, _454, float(int(_416)));
    float3 _1316 = select(_1314, float3(0.0), isnan(_1314));
    float _466 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1316.xy, uint(rint(_1316.z)), _426);
    float3 _1325 = float3(_450, _444, float(int(_416)));
    float3 _1327 = select(_1325, float3(0.0), isnan(_1325));
    float _468 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1327.xy, uint(rint(_1327.z)), _426);
    float3 _1336 = float3(_452, _444, float(int(_416)));
    float3 _1338 = select(_1336, float3(0.0), isnan(_1336));
    float _470 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1338.xy, uint(rint(_1338.z)), _426);
    float _472 = _158 * (*spvDescriptorSet0.fp_c3)._m0[14].y;
    float _474 = fma(_152, (*spvDescriptorSet0.fp_c3)._m0[14].x, _472);
    float _476 = fma(_142, (*spvDescriptorSet0.fp_c3)._m0[14].z, _474);
    float _478 = _476 + (*spvDescriptorSet0.fp_c3)._m0[14].w;
    float _480 = precise::min(_478, 1.0);
    float _482 = -_460;
    float _484 = fma(_482, _460, _462);
    float _486 = -_460;
    float _488 = _480 + _486;
    float _490 = fma(_488, _488, _484);
    bool _492 = _488 <= 0.001000000047497451305389404296875;
    float _494 = float(_492);
    float _496 = 1.0 / _490;
    float _498 = _466 + _464;
    float _500 = _498 + _468;
    float _502 = _484 * _496;
    float _504 = -_142;
    float _506 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _508 = _504 + _506;
    float _510 = -_142;
    float _512 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _514 = _510 + _512;
    float _516 = precise::max(_502, _494);
    float _518 = _500 + _470;
    float _520 = _508 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _522 = precise::clamp(_520, 0.0, 1.0);
    float _524 = _514 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _526 = precise::clamp(_524, 0.0, 1.0);
    float _528 = precise::min(_516, 1.0);
    float _530 = fma(_518, 0.25, _522);
    float _532 = _528 + _526;
    out.m_45.x = (*spvDescriptorSet0.fp_c3)._m0[34].x;
    out.m_45.y = _530;
    out.m_45.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_45.w = _532;
    return out;
}

