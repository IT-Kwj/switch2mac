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
    constant _16* fp_c9 [[id(0)]];
    constant _16* fp_c15 [[id(1)]];
    constant _16* fp_c8 [[id(2)]];
    texture2d<float> fp_t_tcb_8 [[id(3)]];
    sampler fp_t_tcb_8Smplr [[id(4)]];
    texture2d<float> fp_t_tcb_A [[id(5)]];
    sampler fp_t_tcb_ASmplr [[id(6)]];
    texture2d<float> fp_t_tcb_C [[id(7)]];
    sampler fp_t_tcb_CSmplr [[id(8)]];
    sampler fp_t_tcb_8Smplr_w [[id(9)]];
    sampler fp_t_tcb_ASmplr_w [[id(10)]];
    sampler fp_t_tcb_CSmplr_w [[id(11)]];
    constant dm_border_t* dm_border [[id(12)]];
};

struct main0_out
{
    float4 m_48 [[color(0)]];
};

struct main0_in
{
    float4 m_41 [[user(locn0)]];
    float4 m_43 [[user(locn1)]];
    float4 m_52 [[user(locn2)]];
    float4 m_45 [[user(locn3)]];
    float4 m_37 [[user(locn4)]];
    float4 m_39 [[user(locn5)]];
    float4 m_50 [[user(locn7)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _59 = gl_FragCoord.w;
    float _61 = in.m_37.x;
    float _63 = gl_FragCoord.w;
    float _65 = _61 * _63;
    float _67 = in.m_37.y;
    float _69 = gl_FragCoord.w;
    float _71 = _67 * _69;
    float _73 = in.m_37.z;
    float _75 = gl_FragCoord.w;
    float _77 = _73 * _75;
    float _79 = in.m_37.w;
    float _81 = gl_FragCoord.w;
    float _83 = _79 * _81;
    float _85 = in.m_39.x;
    float _87 = gl_FragCoord.w;
    float _89 = _85 * _87;
    float _91 = in.m_39.y;
    float _93 = gl_FragCoord.w;
    float _95 = _91 * _93;
    float _97 = 1.0 / _59;
    float _99 = _97 * _65;
    float _101 = _97 * _71;
    float _103 = _97 * _77;
    float _105 = _97 * _83;
    float _107 = _97 * _89;
    float _109 = _97 * _95;
    float2 _473 = float2(_99, _101);
    float4 _112 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_473, float2(0.0), isnan(_473))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_473, float2(0.0), isnan(_473))).xyzw;
    float _114 = _112.x;
    float _116 = _112.y;
    float _118 = _112.z;
    float _120 = _112.w;
    float2 _492 = float2(_103, _105);
    float4 _122 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_492, float2(0.0), isnan(_492))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_492, float2(0.0), isnan(_492))).xyzw;
    float _124 = _122.x;
    float _126 = _122.y;
    float _128 = _122.z;
    float _130 = _122.w;
    float2 _508 = float2(_107, _109);
    float4 _132 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_508, float2(0.0), isnan(_508))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_508, float2(0.0), isnan(_508))).xyzw;
    float _134 = _132.x;
    float _136 = _132.y;
    float _138 = _132.z;
    float _140 = _132.w;
    float _142 = in.m_41.w;
    float _144 = gl_FragCoord.w;
    float _146 = _142 * _144;
    float _148 = in.m_43.w;
    float _150 = gl_FragCoord.w;
    float _152 = _148 * _150;
    float _154 = in.m_45.x;
    float _156 = gl_FragCoord.w;
    float _158 = _154 * _156;
    float _160 = _97 * _146;
    float _162 = in.m_41.x;
    float _164 = gl_FragCoord.w;
    float _166 = _162 * _164;
    float _168 = in.m_43.z;
    float _170 = gl_FragCoord.w;
    float _172 = _168 * _170;
    float _174 = _97 * _166;
    float _176 = _120 * _130;
    float _178 = _97 * _152;
    float _180 = -_160;
    float _182 = fma(_176, _140, _180);
    float _184 = _178 * _182;
    float _186 = _97 * _158;
    float _188 = 0.0 + _184;
    float _190 = precise::clamp(_188, 0.0, 1.0);
    float _192 = _190 * _186;
    bool _196 = _192 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _198 = isnan(_192);
    bool _200 = _196 || _198;
    bool _202 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _204 = _200 || _202;
    float _206 = in.m_41.z;
    float _208 = gl_FragCoord.w;
    float _210 = _206 * _208;
    float _212 = in.m_43.x;
    float _214 = gl_FragCoord.w;
    float _216 = _212 * _214;
    float _218 = in.m_41.y;
    float _220 = gl_FragCoord.w;
    float _222 = _218 * _220;
    float _224 = in.m_43.y;
    float _226 = gl_FragCoord.w;
    float _228 = _224 * _226;
    if (!_204)
    {
        discard_fragment();
    }
    float _230 = _114 * _114;
    float _232 = _124 * _124;
    float _234 = _116 * _116;
    float _236 = _126 * _126;
    float _238 = _118 * _118;
    float _240 = _230 * _232;
    float _242 = _128 * _128;
    float _244 = _234 * _236;
    float _246 = _136 * _136;
    float _248 = _134 * _134;
    float _250 = _238 * _242;
    float _252 = _138 * _138;
    float _254 = _244 * _246;
    float _256 = _240 * _248;
    float _258 = _97 * _210;
    float _260 = _97 * _216;
    float _262 = _97 * _222;
    float _264 = _97 * _228;
    float _266 = _97 * _172;
    float _268 = _250 * _252;
    float _270 = -_260;
    float _272 = _174 + _270;
    float _274 = -_264;
    float _276 = _262 + _274;
    float _278 = -_266;
    float _280 = _258 + _278;
    float _282 = fma(_256, _272, _260);
    float _284 = fma(_254, _276, _264);
    float _286 = fma(_268, _280, _266);
    if (!_204)
    {
        out.m_48.x = _282;
        out.m_48.y = _284;
        out.m_48.z = _286;
        out.m_48.w = _184;
        return out;
    }
    float _288 = _284 * 0.715200006961822509765625;
    float _290 = in.m_50.w;
    float _292 = gl_FragCoord.w;
    float _294 = _290 * _292;
    float _296 = in.m_50.z;
    float _298 = gl_FragCoord.w;
    float _300 = _296 * _298;
    float _302 = in.m_50.x;
    float _304 = gl_FragCoord.w;
    float _306 = _302 * _304;
    float _308 = fma(_282, 0.2125999927520751953125, _288);
    float _310 = in.m_50.y;
    float _312 = gl_FragCoord.w;
    float _314 = _310 * _312;
    float _316 = fma(_286, 0.072200000286102294921875, _308);
    bool _318 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _320 = 1.0 / _316;
    float _322 = _320 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _324 = precise::clamp(_322, 0.0, 1.0);
    float _326 = fma(_324, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _328 = _97 * _294;
    float _330 = _97 * _300;
    float _332 = _326 * _328;
    float _334 = 0.0 + _192;
    float _336 = precise::clamp(_334, 0.0, 1.0);
    float _338 = _97 * _306;
    float _340 = _97 * _314;
    float _342 = fma(_286, _332, _330);
    float _344 = fma(_282, _332, _338);
    float _346 = fma(_284, _332, _340);
    float _348 = _330;
    if (!_318)
    {
        _348 = _336;
    }
    float _350 = _348;
    bool _352 = !_318;
    float _354 = _350;
    if (!_352)
    {
        float _356 = in.m_52.w;
        float _358 = gl_FragCoord.w;
        float _360 = _356 * _358;
        float _362 = in.m_52.z;
        float _364 = gl_FragCoord.w;
        float _366 = _362 * _364;
        float _368 = _97 * _360;
        float _370 = _97 * _366;
        float _372 = 1.0 / _368;
        float _374 = _370 * _372;
        float _376 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _378 = fma(_374, (*spvDescriptorSet0.fp_c8)._m0[30].w, _376);
        float _380 = 1.0 / _378;
        float _382 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _384 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _386 = fma(_380, _382, _384);
        float _388 = _386 * 8.0;
        float _390 = precise::clamp(_388, 0.0, 1.0);
        float _392 = _336 * _390;
        _354 = _392;
    }
    float _394 = _354;
    float _396 = 0.0 + _394;
    float _398 = precise::clamp(_396, 0.0, 1.0);
    out.m_48.x = _344;
    out.m_48.y = _346;
    out.m_48.z = _342;
    out.m_48.w = _398;
    return out;
}

