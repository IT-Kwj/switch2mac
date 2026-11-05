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
    constant _16* fp_c8 [[id(1)]];
    constant _16* fp_c15 [[id(2)]];
    texture2d<float> fp_t_tcb_10 [[id(3)]];
    sampler fp_t_tcb_10Smplr [[id(4)]];
    texture2d<float> fp_t_tcb_A [[id(5)]];
    sampler fp_t_tcb_ASmplr [[id(6)]];
    texture2d<float> fp_t_tcb_8 [[id(7)]];
    sampler fp_t_tcb_8Smplr [[id(8)]];
    sampler fp_t_tcb_10Smplr_w [[id(9)]];
    sampler fp_t_tcb_ASmplr_w [[id(10)]];
    sampler fp_t_tcb_8Smplr_w [[id(11)]];
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
    float4 m_37 [[user(locn2)]];
    float4 m_45 [[user(locn3)]];
    float4 m_39 [[user(locn4)]];
    float4 m_50 [[user(locn6)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _57 = gl_FragCoord.w;
    float _59 = in.m_37.w;
    float _61 = gl_FragCoord.w;
    float _63 = _59 * _61;
    float _65 = in.m_37.y;
    float _67 = gl_FragCoord.w;
    float _69 = _65 * _67;
    float _71 = in.m_37.x;
    float _73 = gl_FragCoord.w;
    float _75 = _71 * _73;
    float _77 = in.m_39.z;
    float _79 = gl_FragCoord.w;
    float _81 = _77 * _79;
    float _83 = in.m_39.w;
    float _85 = gl_FragCoord.w;
    float _87 = _83 * _85;
    float _89 = in.m_39.x;
    float _91 = gl_FragCoord.w;
    float _93 = _89 * _91;
    float _95 = in.m_39.y;
    float _97 = gl_FragCoord.w;
    float _99 = _95 * _97;
    float _101 = 1.0 / _57;
    float _103 = _101 * _63;
    float _105 = _101 * _69;
    float _107 = _101 * _75;
    float _109 = _101 * _81;
    float _111 = 1.0 / _103;
    float _113 = _101 * _87;
    float _115 = _101 * _93;
    float _117 = _101 * _99;
    float _119 = _105 * _111;
    float _121 = _107 * _111;
    float2 _473 = float2(_121, _119);
    float _123 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_473, float2(0.0), isnan(_473))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_473, float2(0.0), isnan(_473))).x;
    float2 _484 = float2(_109, _113);
    float _125 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_484, float2(0.0), isnan(_484))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_484, float2(0.0), isnan(_484))).w;
    float2 _492 = float2(_115, _117);
    float4 _128 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_492, float2(0.0), isnan(_492))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_492, float2(0.0), isnan(_492))).xyzw;
    float _130 = _128.x;
    float _132 = _128.y;
    float _134 = _128.z;
    float _136 = _128.w;
    float _138 = in.m_37.z;
    float _140 = gl_FragCoord.w;
    float _142 = _138 * _140;
    float _144 = in.m_41.w;
    float _146 = gl_FragCoord.w;
    float _148 = _144 * _146;
    float _150 = in.m_43.w;
    float _152 = gl_FragCoord.w;
    float _154 = _150 * _152;
    float _156 = in.m_45.x;
    float _158 = gl_FragCoord.w;
    float _160 = _156 * _158;
    float _162 = _101 * _142;
    float _164 = _162 * _111;
    float _166 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[142].y;
    float _168 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _170 = fma(_164, (*spvDescriptorSet0.fp_c8)._m0[30].w, _168);
    float _172 = 1.0 / _170;
    float _174 = _101 * _148;
    float _176 = _101 * _160;
    float _178 = in.m_43.x;
    float _180 = gl_FragCoord.w;
    float _182 = _178 * _180;
    float _184 = in.m_43.y;
    float _186 = gl_FragCoord.w;
    float _188 = _184 * _186;
    float _190 = in.m_41.z;
    float _192 = gl_FragCoord.w;
    float _194 = _190 * _192;
    float _196 = in.m_43.z;
    float _198 = gl_FragCoord.w;
    float _200 = _196 * _198;
    float _202 = _101 * _182;
    float _204 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _206 = fma(_123, (*spvDescriptorSet0.fp_c8)._m0[30].w, _204);
    float _208 = _125 + (-1.0);
    float _210 = 1.0 / _206;
    float _212 = _136 + _208;
    float _214 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _216 = _172 * _214;
    float _218 = -_174;
    float _220 = _212 + _218;
    float _222 = _101 * _154;
    float _224 = _222 * _220;
    float _226 = 0.0 + _224;
    float _228 = precise::clamp(_226, 0.0, 1.0);
    float _230 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _232 = -_216;
    float _234 = fma(_210, _230, _232);
    float _236 = _234 * _166;
    float _238 = precise::clamp(_236, 0.0, 1.0);
    float _240 = _228 * _238;
    float _242 = _240 * _176;
    bool _246 = _242 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _248 = isnan(_242);
    bool _250 = _246 || _248;
    bool _252 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _254 = _250 || _252;
    float _256 = in.m_41.x;
    float _258 = gl_FragCoord.w;
    float _260 = _256 * _258;
    float _262 = in.m_41.y;
    float _264 = gl_FragCoord.w;
    float _266 = _262 * _264;
    float _268 = _216;
    if (!_254)
    {
        discard_fragment();
    }
    float _270 = _101 * _188;
    float _272 = _101 * _194;
    float _274 = _101 * _260;
    float _276 = _101 * _266;
    float _278 = _101 * _200;
    float _280 = -_202;
    float _282 = _274 + _280;
    float _284 = -_270;
    float _286 = _276 + _284;
    float _288 = -_278;
    float _290 = _272 + _288;
    float _292 = fma(_130, _282, _202);
    float _294 = fma(_132, _286, _270);
    float _296 = fma(_134, _290, _278);
    float _298 = _270;
    if (!_254)
    {
        out.m_48.x = _292;
        out.m_48.y = _294;
        out.m_48.z = _296;
        out.m_48.w = _224;
        return out;
    }
    float _300 = _294 * 0.715200006961822509765625;
    float _302 = in.m_50.w;
    float _304 = gl_FragCoord.w;
    float _306 = _302 * _304;
    float _308 = in.m_50.x;
    float _310 = gl_FragCoord.w;
    float _312 = _308 * _310;
    float _314 = in.m_50.y;
    float _316 = gl_FragCoord.w;
    float _318 = _314 * _316;
    float _320 = fma(_292, 0.2125999927520751953125, _300);
    float _322 = in.m_50.z;
    float _324 = gl_FragCoord.w;
    float _326 = _322 * _324;
    float _328 = fma(_296, 0.072200000286102294921875, _320);
    bool _330 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _332 = 1.0 / _328;
    if (_330)
    {
        float _334 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _336 = _216 + _334;
        _268 = _336;
    }
    float _338 = _268;
    if (_330)
    {
        float _340 = _338 * 8.0;
        float _342 = precise::clamp(_340, 0.0, 1.0);
        _298 = _342;
    }
    float _344 = _298;
    float _346 = _332 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _348 = precise::clamp(_346, 0.0, 1.0);
    float _350 = fma(_348, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _352 = _101 * _306;
    float _354 = _101 * _312;
    float _356 = _101 * _318;
    float _358 = _350 * _352;
    float _360 = 0.0 + _242;
    float _362 = precise::clamp(_360, 0.0, 1.0);
    float _364 = _101 * _326;
    float _366 = fma(_292, _358, _354);
    float _368 = _362;
    if (_330)
    {
        float _370 = _362 * _344;
        _368 = _370;
    }
    float _372 = _368;
    float _374 = fma(_294, _358, _356);
    float _376 = fma(_296, _358, _364);
    float _378 = 0.0 + _372;
    float _380 = precise::clamp(_378, 0.0, 1.0);
    out.m_48.x = _366;
    out.m_48.y = _374;
    out.m_48.z = _376;
    out.m_48.w = _380;
    return out;
}

