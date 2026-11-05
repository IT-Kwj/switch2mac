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
    bool _272 = false;
    bool _270 = false;
    float _56 = in.m_40.x;
    float _58 = in.m_40.y;
    float2 _532 = float2(_56, _58);
    float3 _62 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_532, float2(0.0), isnan(_532)), int2(0), component::x).xyw;
    float _64 = _62.x;
    float _66 = _62.y;
    float _68 = _62.z;
    float2 _549 = float2(_56, _58);
    float _70 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_549, float2(0.0), isnan(_549))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_549, float2(0.0), isnan(_549))).x;
    float _72 = in.m_42.y;
    float _74 = in.m_42.x;
    float _76 = in.m_44.y;
    float _78 = in.m_46.y;
    float _80 = in.m_44.x;
    float _82 = in.m_46.x;
    float _84 = -_64;
    float _86 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _88 = fma(_84, (*spvDescriptorSet0.fp_c3)._m0[46].z, _86);
    float _90 = -_66;
    float _92 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _94 = fma(_90, (*spvDescriptorSet0.fp_c3)._m0[46].z, _92);
    float _96 = -_68;
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
    float _158 = _146 * _152;
    float _160 = _148 * _154;
    float _162 = -_158;
    float _164 = fma(_148, _156, _162);
    float _166 = -_160;
    float _168 = fma(_150, _152, _166);
    float _170 = _150 * _156;
    float _172 = _164 * _164;
    float _174 = -_70;
    float _176 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _178 = fma(_174, (*spvDescriptorSet0.fp_c3)._m0[46].z, _176);
    float _180 = -_170;
    float _182 = fma(_146, _154, _180);
    float _184 = fma(_168, _168, _172);
    float _186 = -_178;
    bool _190 = _186 > (*spvDescriptorSet0.fp_c3)._m0[40].x;
    float _192 = fma(_182, _182, _184);
    float _194 = -_178;
    bool _196 = _194 > (*spvDescriptorSet0.fp_c3)._m0[39].x;
    bool _198 = !_190;
    uint _201 = uint(_198 ? 0 : 1);
    float _203 = rsqrt(_192);
    uint _205 = 2u;
    if (!_190)
    {
        _205 = 1u;
    }
    uint _207 = _205;
    uint _209 = _207;
    if (!_196)
    {
        _209 = _201;
    }
    uint _211 = _209;
    uint _213 = min(_211, 2u);
    float _215 = _164 * _203;
    float _217 = _168 * _203;
    int _220 = int(_213) << 2;
    float _222 = _182 * _203;
    float _224 = _215 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    float _226 = _178 * _72;
    uint _228 = uint(int(uint(_220) >> uint(2)));
    uint _230 = uint(int(uint(int(_228)) >> uint(2)));
    int _232 = int(_228) & 3;
    float _234 = (*spvDescriptorSet0.fp_c1)._m0[int(_230)][_232];
    float _236 = fma(_217, (*spvDescriptorSet0.fp_c3)._m0[35].x, _224);
    float _238 = _178 * _74;
    float _240 = fma(_222, (*spvDescriptorSet0.fp_c3)._m0[35].z, _236);
    float _242 = abs(_240);
    float _244 = -_242;
    float _246 = _244 + 1.0;
    float _248 = precise::clamp(_246, 0.0, 1.0);
    float _250 = abs(_248);
    float _252 = log2(_250);
    float _254 = _252 * (*spvDescriptorSet0.fp_c3)._m0[48].z;
    float _256 = exp2(_254);
    float _258 = _256 * (*spvDescriptorSet0.fp_c3)._m0[48].y;
    float _260 = fma(_217, _258, _238);
    float _262 = fma(_215, _258, _226);
    float _264 = fma(_222, _258, _178);
    bool _266 = as_type<int>(_234) == 1216;
    if (!_266)
    {
        bool _268 = as_type<int>(_234) == 1488;
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
            _308 = _300;
            _310 = _298;
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
            _308 = _340;
            _310 = _338;
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
            _308 = _372;
            _310 = _370;
            _312 = _374;
        }
    }
    float _378 = _306;
    float _380 = _308;
    float _382 = _310;
    float _384 = _312;
    float _386 = _226 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
    float _388 = _226 * (*spvDescriptorSet0.fp_c3)._m0[15].y;
    float _390 = 1.0 / _378;
    float _392 = float(int(_211));
    float _394 = fma(_238, (*spvDescriptorSet0.fp_c3)._m0[13].x, _386);
    float _396 = fma(_238, (*spvDescriptorSet0.fp_c3)._m0[15].x, _388);
    float2 _1164 = float2(_56, _58);
    float2 _400 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_1164, float2(0.0), isnan(_1164))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_1164, float2(0.0), isnan(_1164))).xy;
    float _402 = _400.x;
    float _404 = _400.y;
    float _406 = _226 * (*spvDescriptorSet0.fp_c3)._m0[12].y;
    float _408 = fma(_178, (*spvDescriptorSet0.fp_c3)._m0[13].z, _394);
    float _410 = fma(_178, (*spvDescriptorSet0.fp_c3)._m0[15].z, _396);
    float _412 = rint(_392);
    float _414 = precise::max(_412, 0.0);
    uint _416 = uint(_414);
    uint _418 = clamp(_416, 0u, 65535u);
    float _420 = _408 + (*spvDescriptorSet0.fp_c3)._m0[13].w;
    float _422 = _410 + (*spvDescriptorSet0.fp_c3)._m0[15].w;
    float _424 = fma(_238, (*spvDescriptorSet0.fp_c3)._m0[12].x, _406);
    float _426 = 1.0 / _422;
    float _428 = fma(_178, (*spvDescriptorSet0.fp_c3)._m0[12].z, _424);
    float _430 = _390 * _380;
    float _432 = _390 * _382;
    float _434 = _390 * _384;
    float _436 = precise::clamp(_434, 0.0, 1.0);
    float _438 = _428 + (*spvDescriptorSet0.fp_c3)._m0[12].w;
    float _440 = _438 * _426;
    float _442 = _420 * _426;
    float2 _1242 = float2(_440, _442);
    float2 _444 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_1242, float2(0.0), isnan(_1242))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_1242, float2(0.0), isnan(_1242))).xy;
    float _446 = _444.x;
    float _448 = _444.y;
    float3 _1257 = float3(_432, _430, float(int(_418)));
    float3 _1261 = select(_1257, float3(0.0), isnan(_1257));
    float _450 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1261.xy, uint(rint(_1261.z)), _436);
    float _452 = fma(_402, 2.0, -1.0);
    float _454 = fma(_404, 2.0, -1.0);
    float _456 = _452 * (*spvDescriptorSet0.fp_c3)._m0[36].z;
    float _458 = _454 * (*spvDescriptorSet0.fp_c3)._m0[36].w;
    float _460 = fma(_456, 2.0, _56);
    float _462 = fma(_458, 2.0, _58);
    float2 _1288 = float2(_460, _462);
    float _464 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1288, float2(0.0), isnan(_1288))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1288, float2(0.0), isnan(_1288))).x;
    float _466 = _226 * (*spvDescriptorSet0.fp_c3)._m0[14].y;
    float _468 = -_178;
    float _470 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _472 = _468 + _470;
    float _474 = fma(_238, (*spvDescriptorSet0.fp_c3)._m0[14].x, _466);
    float _476 = -_446;
    float _478 = fma(_476, _446, _448);
    float _480 = fma(_178, (*spvDescriptorSet0.fp_c3)._m0[14].z, _474);
    float _482 = -_178;
    float _484 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _486 = _482 + _484;
    float _488 = _472 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _490 = precise::clamp(_488, 0.0, 1.0);
    float _492 = _480 + (*spvDescriptorSet0.fp_c3)._m0[14].w;
    float _494 = _486 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _496 = precise::clamp(_494, 0.0, 1.0);
    float _498 = _450 + _490;
    float _500 = precise::min(_492, 1.0);
    float _502 = -_446;
    float _504 = _500 + _502;
    float _506 = fma(_504, _504, _478);
    bool _508 = _504 <= 0.001000000047497451305389404296875;
    float _510 = float(_508);
    float _512 = 1.0 / _506;
    float _514 = _478 * _512;
    float _516 = precise::max(_514, _510);
    float _518 = precise::min(_516, 1.0);
    float _520 = _518 + _496;
    out.m_49.x = _464;
    out.m_49.y = _498;
    out.m_49.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_49.w = _520;
    return out;
}

