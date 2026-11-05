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
    texture2d<float> fp_t_tcb_A [[id(4)]];
    sampler fp_t_tcb_ASmplr [[id(5)]];
    texture2d<float> fp_t_tcb_E [[id(6)]];
    sampler fp_t_tcb_ESmplr [[id(7)]];
    texture2d_array<float> fp_t_tcb_C [[id(8)]];
    sampler fp_t_tcb_CSmplr [[id(9)]];
    sampler fp_t_tcb_8Smplr_w [[id(10)]];
    sampler fp_t_tcb_ASmplr_w [[id(11)]];
    sampler fp_t_tcb_ESmplr_w [[id(12)]];
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
    bool _272 = false;
    bool _270 = false;
    float _54 = in.m_38.x;
    float _56 = in.m_38.y;
    float2 _512 = float2(_54, _56);
    float3 _60 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_512, float2(0.0), isnan(_512)), int2(0), component::x).xyw;
    float _62 = _60.x;
    float _64 = _60.y;
    float _66 = _60.z;
    float2 _529 = float2(_54, _56);
    float _68 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_529, float2(0.0), isnan(_529))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_529, float2(0.0), isnan(_529))).x;
    float2 _537 = float2(_54, _56);
    float _70 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_537, float2(0.0), isnan(_537))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_537, float2(0.0), isnan(_537))).x;
    float _72 = in.m_40.y;
    float _74 = in.m_40.x;
    float _76 = in.m_42.y;
    float _78 = in.m_44.y;
    float _80 = in.m_42.x;
    float _82 = in.m_44.x;
    float _84 = -_62;
    float _86 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _88 = fma(_84, (*spvDescriptorSet0.fp_c3)._m0[46].z, _86);
    float _90 = -_64;
    float _92 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _94 = fma(_90, (*spvDescriptorSet0.fp_c3)._m0[46].z, _92);
    float _96 = -_66;
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
    float _158 = -_68;
    float _160 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _162 = fma(_158, (*spvDescriptorSet0.fp_c3)._m0[46].z, _160);
    float _164 = _146 * _152;
    float _166 = _148 * _154;
    float _168 = _162 * _74;
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
    float _196 = fma(_178, _178, _186);
    bool _198 = !_184;
    uint _201 = uint(_198 ? 0 : 1);
    float _203 = fma(_190, _190, _196);
    uint _205 = 2u;
    if (!_184)
    {
        _205 = 1u;
    }
    uint _207 = _205;
    float _209 = rsqrt(_203);
    uint _211 = _207;
    if (!_194)
    {
        _211 = _201;
    }
    uint _213 = _211;
    uint _215 = min(_213, 2u);
    int _218 = int(_215) << 2;
    float _220 = _162 * _72;
    float _222 = _172 * _209;
    float _224 = _178 * _209;
    float _226 = _190 * _209;
    float _228 = _222 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    uint _230 = uint(int(uint(_218) >> uint(2)));
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
    float _260 = fma(_224, _258, _168);
    float _262 = fma(_222, _258, _220);
    float _264 = fma(_226, _258, _162);
    bool _266 = as_type<int>(_236) == 1248;
    if (!_266)
    {
        bool _268 = as_type<int>(_236) == 1520;
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
            _308 = _298;
            _310 = _300;
            _312 = _302;
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
            _308 = _338;
            _310 = _340;
            _312 = _342;
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
            _308 = _370;
            _310 = _372;
            _312 = _374;
        }
    }
    float _378 = _306;
    float _380 = _308;
    float _382 = _310;
    float _384 = _312;
    float _386 = _220 * (*spvDescriptorSet0.fp_c3)._m0[15].y;
    float _388 = _220 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
    float _390 = 1.0 / _378;
    float _392 = fma(_168, (*spvDescriptorSet0.fp_c3)._m0[15].x, _386);
    float _394 = fma(_168, (*spvDescriptorSet0.fp_c3)._m0[13].x, _388);
    float _396 = fma(_162, (*spvDescriptorSet0.fp_c3)._m0[15].z, _392);
    float _398 = fma(_162, (*spvDescriptorSet0.fp_c3)._m0[13].z, _394);
    float _400 = _396 + (*spvDescriptorSet0.fp_c3)._m0[15].w;
    float _402 = _220 * (*spvDescriptorSet0.fp_c3)._m0[12].y;
    float _404 = _398 + (*spvDescriptorSet0.fp_c3)._m0[13].w;
    float _406 = fma(_168, (*spvDescriptorSet0.fp_c3)._m0[12].x, _402);
    float _408 = 1.0 / _400;
    float _410 = fma(_162, (*spvDescriptorSet0.fp_c3)._m0[12].z, _406);
    float _412 = _410 + (*spvDescriptorSet0.fp_c3)._m0[12].w;
    float _414 = _412 * _408;
    float _416 = _404 * _408;
    float _418 = _390 * _380;
    float _420 = _390 * _382;
    float _422 = _390 * _384;
    float _424 = precise::clamp(_422, 0.0, 1.0);
    float _426 = float(int(_213));
    float2 _1208 = float2(_414, _416);
    float2 _430 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_1208, float2(0.0), isnan(_1208))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_1208, float2(0.0), isnan(_1208))).xy;
    float _432 = _430.x;
    float _434 = _430.y;
    float _436 = rint(_426);
    float _438 = precise::max(_436, 0.0);
    uint _440 = uint(_438);
    uint _442 = clamp(_440, 0u, 65535u);
    float3 _1233 = float3(_418, _420, float(int(_442)));
    float3 _1237 = select(_1233, float3(0.0), isnan(_1233));
    float _444 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1237.xy, uint(rint(_1237.z)), _424);
    float _446 = _220 * (*spvDescriptorSet0.fp_c3)._m0[14].y;
    float _448 = fma(_168, (*spvDescriptorSet0.fp_c3)._m0[14].x, _446);
    float _450 = fma(_162, (*spvDescriptorSet0.fp_c3)._m0[14].z, _448);
    float _452 = _450 + (*spvDescriptorSet0.fp_c3)._m0[14].w;
    float _454 = precise::min(_452, 1.0);
    float _456 = -_432;
    float _458 = fma(_456, _432, _434);
    float _460 = -_432;
    float _462 = _454 + _460;
    float _464 = fma(_462, _462, _458);
    bool _466 = _462 <= 0.001000000047497451305389404296875;
    float _468 = float(_466);
    float _470 = 1.0 / _464;
    float _472 = _458 * _470;
    float _474 = -_162;
    float _476 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _478 = _474 + _476;
    float _480 = precise::max(_472, _468);
    float _482 = -_162;
    float _484 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _486 = _482 + _484;
    float _488 = _478 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _490 = precise::clamp(_488, 0.0, 1.0);
    float _492 = precise::min(_480, 1.0);
    float _494 = _486 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _496 = precise::clamp(_494, 0.0, 1.0);
    float _498 = _444 + _490;
    float _500 = _492 + _496;
    out.m_47.x = _70;
    out.m_47.y = _498;
    out.m_47.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_47.w = _500;
    return out;
}

