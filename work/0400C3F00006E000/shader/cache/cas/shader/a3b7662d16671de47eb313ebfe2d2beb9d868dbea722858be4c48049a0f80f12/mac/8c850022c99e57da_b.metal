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
    constant _16* fp_c3 [[id(0)]];
    texture2d<float> fp_t_tcb_8 [[id(1)]];
    sampler fp_t_tcb_8Smplr [[id(2)]];
    texture2d_array<float> fp_t_tcb_A [[id(3)]];
    sampler fp_t_tcb_ASmplr [[id(4)]];
    sampler fp_t_tcb_8Smplr_w [[id(5)]];
    sampler fp_t_tcb_ASmplr_w [[id(6)]];
    constant dm_border_t* dm_border [[id(7)]];
};

struct main0_out
{
    float4 m_51 [[color(0)]];
};

struct main0_in
{
    float4 m_32 [[user(locn0), center_no_perspective]];
    float4 m_53 [[user(locn1)]];
    float4 m_55 [[user(locn2)]];
    float4 m_38 [[user(locn3)]];
    float4 m_48 [[user(locn4)]];
    float4 m_42 [[user(locn5)]];
    float4 m_40 [[user(locn6)]];
    float4 m_46 [[user(locn7)]];
    float4 m_44 [[user(locn8)]];
    float4 m_36 [[user(locn9)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _62 = in.m_32.x;
    float _64 = in.m_32.y;
    float2 _464 = float2(_62, _64);
    float _66 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_464, float2(0.0), isnan(_464))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_464, float2(0.0), isnan(_464))).x;
    float _68 = gl_FragCoord.w;
    float _70 = in.m_36.y;
    float _72 = gl_FragCoord.w;
    float _74 = _70 * _72;
    float _76 = in.m_36.x;
    float _78 = gl_FragCoord.w;
    float _80 = _76 * _78;
    float _82 = in.m_36.z;
    float _84 = gl_FragCoord.w;
    float _86 = _82 * _84;
    float _88 = in.m_36.w;
    float _90 = gl_FragCoord.w;
    float _92 = _88 * _90;
    float _94 = in.m_38.y;
    float _96 = gl_FragCoord.w;
    float _98 = _94 * _96;
    float _100 = in.m_40.x;
    float _102 = gl_FragCoord.w;
    float _104 = _100 * _102;
    float _106 = in.m_38.z;
    float _108 = gl_FragCoord.w;
    float _110 = _106 * _108;
    float _112 = in.m_42.x;
    float _114 = gl_FragCoord.w;
    float _116 = _112 * _114;
    float _118 = 1.0 / _68;
    float _120 = _118 * _74;
    float _122 = _118 * _80;
    float _124 = _120 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
    float _126 = _120 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
    float _128 = _120 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
    float _130 = _118 * _86;
    float _132 = fma(_122, (*spvDescriptorSet0.fp_c3)._m0[6].x, _124);
    float _134 = fma(_122, (*spvDescriptorSet0.fp_c3)._m0[7].x, _126);
    float _136 = fma(_122, (*spvDescriptorSet0.fp_c3)._m0[8].x, _128);
    float _138 = _118 * _92;
    float _140 = fma(_130, (*spvDescriptorSet0.fp_c3)._m0[6].z, _132);
    float _142 = fma(_130, (*spvDescriptorSet0.fp_c3)._m0[7].z, _134);
    float _144 = fma(_130, (*spvDescriptorSet0.fp_c3)._m0[8].z, _136);
    float _146 = in.m_38.x;
    float _148 = gl_FragCoord.w;
    float _150 = _146 * _148;
    float _152 = fma(_138, (*spvDescriptorSet0.fp_c3)._m0[6].w, _140);
    float _154 = fma(_138, (*spvDescriptorSet0.fp_c3)._m0[7].w, _142);
    float _156 = fma(_138, (*spvDescriptorSet0.fp_c3)._m0[8].w, _144);
    float _158 = in.m_44.x;
    float _160 = gl_FragCoord.w;
    float _162 = _158 * _160;
    float _164 = 1.0 / _156;
    float _166 = _118 * _162;
    float _168 = -_66;
    float _170 = fma(_168, (*spvDescriptorSet0.fp_c3)._m0[0].y, 1.0);
    float _172 = 1.0 / _170;
    float _174 = -(*spvDescriptorSet0.fp_c3)._m0[0].x;
    float _176 = _172 * _174;
    float _178 = in.m_46.x;
    float _180 = gl_FragCoord.w;
    float _182 = _178 * _180;
    float _184 = _176 * _164;
    float _186 = _154 * _184;
    float _188 = _152 * _184;
    float _190 = _186 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _192 = _186 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _194 = _186 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
    float _196 = _118 * _98;
    float _198 = fma(_188, (*spvDescriptorSet0.fp_c3)._m0[2].x, _190);
    float _200 = fma(_188, (*spvDescriptorSet0.fp_c3)._m0[3].x, _192);
    float _202 = fma(_188, (*spvDescriptorSet0.fp_c3)._m0[4].x, _194);
    float _204 = _118 * _150;
    float _206 = fma(_176, (*spvDescriptorSet0.fp_c3)._m0[2].z, _198);
    float _208 = fma(_176, (*spvDescriptorSet0.fp_c3)._m0[3].z, _200);
    float _210 = fma(_176, (*spvDescriptorSet0.fp_c3)._m0[4].z, _202);
    float _212 = _118 * _110;
    float _214 = _206 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _216 = _208 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _218 = _118 * _116;
    float _220 = -_204;
    float _222 = _214 + _220;
    float _224 = -_196;
    float _226 = _216 + _224;
    float _228 = _118 * _104;
    float _230 = _210 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
    float _232 = _226 * _228;
    float _234 = -_212;
    float _236 = _230 + _234;
    float _238 = _118 * _182;
    float _240 = fma(_222, _218, _232);
    float _242 = fma(_236, _238, _240);
    float _244 = _166 + _242;
    float _246 = abs(_244);
    bool _250 = _246 > 0.5;
    float _252 = in.m_40.z;
    float _254 = gl_FragCoord.w;
    float _256 = _252 * _254;
    float _258 = in.m_42.z;
    float _260 = gl_FragCoord.w;
    float _262 = _258 * _260;
    float _264 = in.m_48.x;
    float _266 = gl_FragCoord.w;
    float _268 = _264 * _266;
    float _270 = in.m_46.z;
    float _272 = gl_FragCoord.w;
    float _274 = _270 * _272;
    if (_250)
    {
        discard_fragment();
    }
    float _276 = in.m_44.z;
    float _278 = gl_FragCoord.w;
    float _280 = _276 * _278;
    float _282 = _118 * _256;
    float _284 = _118 * _262;
    float _286 = _118 * _268;
    float _288 = _118 * _274;
    float _290 = _226 * _282;
    float _292 = rint(_286);
    float _294 = precise::max(_292, 0.0);
    uint _297 = uint(_294);
    uint _299 = clamp(_297, 0u, 65535u);
    float _301 = fma(_222, _284, _290);
    float _303 = fma(_236, _288, _301);
    float _305 = _118 * _280;
    float _307 = _305 + _303;
    float _309 = -_244;
    float _311 = _309 + 0.5;
    float _313 = _307 + 0.5;
    float3 _855 = float3(_311, _313, float(int(_299)));
    float3 _859 = select(_855, float3(0.0), isnan(_855));
    float4 _316 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _859.xy, uint(rint(_859.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _859.xy, uint(rint(_859.z))).xyzw;
    float _318 = _316.x;
    float _320 = _316.y;
    float _322 = _316.z;
    float _324 = _316.w;
    float _326 = in.m_40.y;
    float _328 = gl_FragCoord.w;
    float _330 = _326 * _328;
    float _332 = in.m_42.y;
    float _334 = gl_FragCoord.w;
    float _336 = _332 * _334;
    float _338 = in.m_46.y;
    float _340 = gl_FragCoord.w;
    float _342 = _338 * _340;
    float _344 = in.m_44.y;
    float _346 = gl_FragCoord.w;
    float _348 = _344 * _346;
    float _350 = _118 * _330;
    float _352 = _226 * _350;
    float _354 = _118 * _336;
    float _356 = fma(_222, _354, _352);
    float _358 = _118 * _342;
    float _360 = fma(_236, _358, _356);
    float _362 = _118 * _348;
    float _364 = _362 + _360;
    if (_250)
    {
        out.m_51.x = 0.0;
        out.m_51.y = 0.0;
        out.m_51.z = 0.0;
        out.m_51.w = 0.0;
        return out;
    }
    float _366 = abs(_307);
    bool _368 = _366 > 0.5;
    if (_368)
    {
        discard_fragment();
    }
    if (_368)
    {
        out.m_51.x = 0.0;
        out.m_51.y = 0.0;
        out.m_51.z = 0.0;
        out.m_51.w = 0.0;
        return out;
    }
    float _370 = in.m_53.x;
    float _372 = gl_FragCoord.w;
    float _374 = _370 * _372;
    float _376 = in.m_53.z;
    float _378 = gl_FragCoord.w;
    float _380 = _376 * _378;
    float _382 = in.m_55.x;
    float _384 = gl_FragCoord.w;
    float _386 = _382 * _384;
    float _388 = in.m_55.w;
    float _390 = gl_FragCoord.w;
    float _392 = _388 * _390;
    float _394 = in.m_53.y;
    float _396 = gl_FragCoord.w;
    float _398 = _394 * _396;
    float _400 = in.m_55.y;
    float _402 = gl_FragCoord.w;
    float _404 = _400 * _402;
    float _406 = in.m_55.z;
    float _408 = gl_FragCoord.w;
    float _410 = _406 * _408;
    float _412 = -_364;
    float _414 = _412 + 0.5;
    float _416 = _118 * _374;
    float _418 = _118 * _380;
    bool _420 = _364 > _416;
    float _422 = _418 * _414;
    float _424 = _118 * _386;
    float _426 = -_364;
    float _428 = _426 + (-0.5);
    float _430 = _118 * _392;
    float _432 = _118 * _398;
    float _434 = _118 * _404;
    float _436 = _118 * _410;
    float _438 = _324 * _430;
    float _440 = _422;
    if (!_420)
    {
        float _442 = _432 * _428;
        _440 = _442;
    }
    float _444 = _440;
    float _446 = _318 * _424;
    float _448 = _320 * _434;
    float _450 = _322 * _436;
    float _452 = _438 * _444;
    out.m_51.x = _446;
    out.m_51.y = _448;
    out.m_51.z = _450;
    out.m_51.w = _452;
    return out;
}

