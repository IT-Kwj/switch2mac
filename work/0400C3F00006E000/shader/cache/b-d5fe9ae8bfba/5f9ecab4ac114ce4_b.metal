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
    bool _282 = false;
    bool _280 = false;
    float _54 = in.m_38.x;
    float _56 = in.m_38.y;
    float2 _522 = float2(_54, _56);
    float3 _60 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_522, float2(0.0), isnan(_522)), int2(0), component::x).xyw;
    float _62 = _60.x;
    float _64 = _60.y;
    float _66 = _60.z;
    float2 _539 = float2(_54, _56);
    float _68 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_539, float2(0.0), isnan(_539))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_539, float2(0.0), isnan(_539))).x;
    float2 _547 = float2(_54, _56);
    float _70 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_547, float2(0.0), isnan(_547))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_547, float2(0.0), isnan(_547))).x;
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
    float _142 = -_68;
    float _144 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _146 = fma(_142, (*spvDescriptorSet0.fp_c3)._m0[46].z, _144);
    float _148 = rsqrt(_140);
    float _150 = _146 * _74;
    float _152 = -_146;
    bool _156 = _152 > (*spvDescriptorSet0.fp_c3)._m0[40].x;
    float _158 = -_146;
    bool _160 = _158 > (*spvDescriptorSet0.fp_c3)._m0[39].x;
    float _162 = -_146;
    bool _164 = _162 > (*spvDescriptorSet0.fp_c3)._m0[41].x;
    float _166 = rsqrt(_138);
    float _168 = _132 * _148;
    float _170 = _112 * _148;
    float _172 = _120 * _148;
    float _174 = _116 * _166;
    float _176 = _128 * _166;
    float _178 = _108 * _166;
    float _180 = _174 * _168;
    float _182 = _176 * _170;
    float _184 = -_180;
    float _186 = fma(_176, _172, _184);
    float _188 = _178 * _172;
    float _190 = -_182;
    float _192 = fma(_178, _168, _190);
    float _194 = _186 * _186;
    float _196 = -_188;
    float _198 = fma(_174, _170, _196);
    int _201 = 2;
    if (!_156)
    {
        _201 = 1;
    }
    int _203 = _201;
    float _205 = fma(_192, _192, _194);
    float _207 = fma(_198, _198, _205);
    bool _209 = !_156;
    int _211 = _209 ? 0 : 1;
    int _213 = _203;
    if (!_160)
    {
        _213 = _211;
    }
    int _215 = _213;
    float _217 = rsqrt(_207);
    int _219 = _215 + 1;
    uint _222 = uint(_219);
    if (!_164)
    {
        _222 = uint(_215);
    }
    uint _224 = _222;
    uint _226 = min(_224, 2u);
    int _228 = int(_226) << 2;
    float _230 = _186 * _217;
    float _232 = _192 * _217;
    float _234 = _198 * _217;
    float _236 = _146 * _72;
    float _238 = _230 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    uint _240 = uint(int(uint(_228) >> uint(2)));
    uint _242 = uint(int(uint(int(_240)) >> uint(2)));
    int _244 = int(_240) & 3;
    float _246 = (*spvDescriptorSet0.fp_c1)._m0[int(_242)][_244];
    float _248 = fma(_232, (*spvDescriptorSet0.fp_c3)._m0[35].x, _238);
    float _250 = fma(_234, (*spvDescriptorSet0.fp_c3)._m0[35].z, _248);
    float _252 = abs(_250);
    float _254 = -_252;
    float _256 = _254 + 1.0;
    float _258 = precise::clamp(_256, 0.0, 1.0);
    float _260 = abs(_258);
    float _262 = log2(_260);
    float _264 = _262 * (*spvDescriptorSet0.fp_c3)._m0[48].z;
    float _266 = exp2(_264);
    float _268 = _266 * (*spvDescriptorSet0.fp_c3)._m0[48].y;
    float _270 = fma(_232, _268, _150);
    float _272 = fma(_230, _268, _236);
    float _274 = fma(_234, _268, _146);
    bool _276 = as_type<int>(_246) == 1296;
    if (!_276)
    {
        bool _278 = as_type<int>(_246) == 1568;
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
    float _396 = _236 * (*spvDescriptorSet0.fp_c3)._m0[15].y;
    float _398 = _236 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
    float _400 = 1.0 / _388;
    float _402 = fma(_150, (*spvDescriptorSet0.fp_c3)._m0[15].x, _396);
    float _404 = fma(_150, (*spvDescriptorSet0.fp_c3)._m0[13].x, _398);
    float _406 = fma(_146, (*spvDescriptorSet0.fp_c3)._m0[15].z, _402);
    float _408 = fma(_146, (*spvDescriptorSet0.fp_c3)._m0[13].z, _404);
    float _410 = _406 + (*spvDescriptorSet0.fp_c3)._m0[15].w;
    float _412 = _236 * (*spvDescriptorSet0.fp_c3)._m0[12].y;
    float _414 = _408 + (*spvDescriptorSet0.fp_c3)._m0[13].w;
    float _416 = fma(_150, (*spvDescriptorSet0.fp_c3)._m0[12].x, _412);
    float _418 = 1.0 / _410;
    float _420 = fma(_146, (*spvDescriptorSet0.fp_c3)._m0[12].z, _416);
    float _422 = _420 + (*spvDescriptorSet0.fp_c3)._m0[12].w;
    float _424 = _422 * _418;
    float _426 = _414 * _418;
    float _428 = _400 * _390;
    float _430 = _400 * _392;
    float _432 = _400 * _394;
    float _434 = precise::clamp(_432, 0.0, 1.0);
    float _436 = float(int(_224));
    float2 _1234 = float2(_424, _426);
    float2 _440 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_1234, float2(0.0), isnan(_1234))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_1234, float2(0.0), isnan(_1234))).xy;
    float _442 = _440.x;
    float _444 = _440.y;
    float _446 = rint(_436);
    float _448 = precise::max(_446, 0.0);
    uint _450 = uint(_448);
    uint _452 = clamp(_450, 0u, 65535u);
    float3 _1259 = float3(_428, _430, float(int(_452)));
    float3 _1263 = select(_1259, float3(0.0), isnan(_1259));
    float _454 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1263.xy, uint(rint(_1263.z)), _434);
    float _456 = _236 * (*spvDescriptorSet0.fp_c3)._m0[14].y;
    float _458 = fma(_150, (*spvDescriptorSet0.fp_c3)._m0[14].x, _456);
    float _460 = fma(_146, (*spvDescriptorSet0.fp_c3)._m0[14].z, _458);
    float _462 = _460 + (*spvDescriptorSet0.fp_c3)._m0[14].w;
    float _464 = precise::min(_462, 1.0);
    float _466 = -_442;
    float _468 = fma(_466, _442, _444);
    float _470 = -_442;
    float _472 = _464 + _470;
    float _474 = -_146;
    float _476 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _478 = _474 + _476;
    float _480 = fma(_472, _472, _468);
    bool _482 = _472 <= 0.001000000047497451305389404296875;
    float _484 = float(_482);
    float _486 = _478 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _488 = precise::clamp(_486, 0.0, 1.0);
    float _490 = 1.0 / _480;
    float _492 = _468 * _490;
    float _494 = -_146;
    float _496 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _498 = _494 + _496;
    float _500 = precise::max(_492, _484);
    float _502 = _498 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _504 = precise::clamp(_502, 0.0, 1.0);
    float _506 = precise::min(_500, 1.0);
    float _508 = _454 + _504;
    float _510 = _506 + _488;
    out.m_47.x = _70;
    out.m_47.y = _508;
    out.m_47.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_47.w = _510;
    return out;
}

