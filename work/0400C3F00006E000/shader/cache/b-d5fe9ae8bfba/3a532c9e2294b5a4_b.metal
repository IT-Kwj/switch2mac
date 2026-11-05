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
    constant _16* fp_c8 [[id(0)]];
    constant _16* fp_c9 [[id(1)]];
    constant _16* fp_c15 [[id(2)]];
    texture2d<float> fp_t_tcb_10 [[id(3)]];
    sampler fp_t_tcb_10Smplr [[id(4)]];
    texture2d<float> fp_t_tcb_8 [[id(5)]];
    sampler fp_t_tcb_8Smplr [[id(6)]];
    texture2d<float> fp_t_tcb_A [[id(7)]];
    sampler fp_t_tcb_ASmplr [[id(8)]];
    sampler fp_t_tcb_10Smplr_w [[id(9)]];
    sampler fp_t_tcb_8Smplr_w [[id(10)]];
    sampler fp_t_tcb_ASmplr_w [[id(11)]];
    constant dm_border_t* dm_border [[id(12)]];
};

struct main0_out
{
    float4 m_50 [[color(0)]];
};

struct main0_in
{
    float4 m_43 [[user(locn0)]];
    float4 m_45 [[user(locn1)]];
    float4 m_39 [[user(locn2)]];
    float4 m_37 [[user(locn3)]];
    float4 m_47 [[user(locn4)]];
    float4 m_41 [[user(locn5)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _57 = gl_FragCoord.w;
    float _59 = in.m_37.w;
    float _61 = gl_FragCoord.w;
    float _63 = _59 * _61;
    float _65 = in.m_37.x;
    float _67 = gl_FragCoord.w;
    float _69 = _65 * _67;
    float _71 = in.m_37.y;
    float _73 = gl_FragCoord.w;
    float _75 = _71 * _73;
    float _77 = in.m_39.x;
    float _79 = gl_FragCoord.w;
    float _81 = _77 * _79;
    float _83 = in.m_39.z;
    float _85 = gl_FragCoord.w;
    float _87 = _83 * _85;
    float _89 = in.m_39.w;
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
    float _113 = _101 * _93;
    float _115 = _105 * _111;
    float _117 = _107 * _111;
    float _119 = _101 * _87;
    float _121 = _101 * _99;
    float2 _463 = float2(_115, _117);
    float _123 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_463, float2(0.0), isnan(_463))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_463, float2(0.0), isnan(_463))).x;
    float2 _474 = float2(_109, _121);
    float _125 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_474, float2(0.0), isnan(_474))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_474, float2(0.0), isnan(_474))).w;
    float2 _482 = float2(_119, _113);
    float4 _128 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_482, float2(0.0), isnan(_482))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_482, float2(0.0), isnan(_482))).xyzw;
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
    float _156 = in.m_45.w;
    float _158 = gl_FragCoord.w;
    float _160 = _156 * _158;
    float _162 = in.m_47.x;
    float _164 = gl_FragCoord.w;
    float _166 = _162 * _164;
    float _168 = _101 * _142;
    float _170 = _168 * _111;
    float _172 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _174 = fma(_170, (*spvDescriptorSet0.fp_c8)._m0[30].w, _172);
    float _176 = 1.0 / _174;
    float _178 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _180 = _176 * _178;
    float _182 = in.m_41.x;
    float _184 = gl_FragCoord.w;
    float _186 = _182 * _184;
    float _188 = in.m_41.y;
    float _190 = gl_FragCoord.w;
    float _192 = _188 * _190;
    float _194 = in.m_41.z;
    float _196 = gl_FragCoord.w;
    float _198 = _194 * _196;
    float _200 = _101 * _192;
    float _202 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _204 = fma(_123, (*spvDescriptorSet0.fp_c8)._m0[30].w, _202);
    float _206 = _125 * _136;
    float _208 = _101 * _148;
    float _210 = 1.0 / _204;
    float _212 = _206 * _208;
    float _214 = _101 * _154;
    float _216 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[142].y;
    float _218 = _214 * _212;
    float _220 = _101 * _160;
    float _222 = _220 * _218;
    float _224 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _226 = -_180;
    float _228 = fma(_210, _224, _226);
    float _230 = 0.0 + _222;
    float _232 = precise::clamp(_230, 0.0, 1.0);
    float _234 = _228 * _216;
    float _236 = precise::clamp(_234, 0.0, 1.0);
    float _238 = _101 * _166;
    float _240 = _232 * _236;
    float _242 = _240 * _238;
    bool _246 = _242 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _248 = isnan(_242);
    bool _250 = _246 || _248;
    bool _252 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _254 = _250 || _252;
    float _256 = in.m_43.y;
    float _258 = gl_FragCoord.w;
    float _260 = _256 * _258;
    float _262 = in.m_43.x;
    float _264 = gl_FragCoord.w;
    float _266 = _262 * _264;
    float _268 = in.m_45.x;
    float _270 = gl_FragCoord.w;
    float _272 = _268 * _270;
    float _274 = in.m_43.z;
    float _276 = gl_FragCoord.w;
    float _278 = _274 * _276;
    float _280 = in.m_45.y;
    float _282 = gl_FragCoord.w;
    float _284 = _280 * _282;
    float _286 = in.m_45.z;
    float _288 = gl_FragCoord.w;
    float _290 = _286 * _288;
    float _292 = _180;
    float _294 = _101;
    if (!_254)
    {
        discard_fragment();
    }
    float _296 = _101 * _186;
    float _298 = _101 * _260;
    float _300 = _101 * _266;
    float _302 = _101 * _272;
    float _304 = _101 * _278;
    float _306 = _101 * _284;
    float _308 = _101 * _290;
    float _310 = fma(_130, _300, _302);
    float _312 = _101 * _198;
    float _314 = fma(_132, _298, _306);
    float _316 = fma(_134, _304, _308);
    float _318 = _310 * _296;
    float _320 = _314 * _200;
    float _322 = _316 * _312;
    if (!_254)
    {
        out.m_50.x = _318;
        out.m_50.y = _320;
        out.m_50.z = _322;
        out.m_50.w = _222;
        return out;
    }
    float _324 = _320 * 0.715200006961822509765625;
    float _326 = fma(_318, 0.2125999927520751953125, _324);
    float _328 = fma(_322, 0.072200000286102294921875, _326);
    bool _330 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _332 = 1.0 / _328;
    float _334 = 0.0 + _242;
    float _336 = precise::clamp(_334, 0.0, 1.0);
    float _338 = _336;
    if (_330)
    {
        float _340 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _342 = _180 + _340;
        _292 = _342;
    }
    float _344 = _292;
    float _346 = _332 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _348 = precise::clamp(_346, 0.0, 1.0);
    if (_330)
    {
        float _350 = _344 * 8.0;
        float _352 = precise::clamp(_350, 0.0, 1.0);
        _294 = _352;
    }
    float _354 = _294;
    float _356 = fma(_348, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    if (_330)
    {
        float _358 = _336 * _354;
        _338 = _358;
    }
    float _360 = _338;
    float _362 = _318 * _356;
    float _364 = _320 * _356;
    float _366 = _322 * _356;
    float _368 = 0.0 + _360;
    float _370 = precise::clamp(_368, 0.0, 1.0);
    out.m_50.x = _362;
    out.m_50.y = _364;
    out.m_50.z = _366;
    out.m_50.w = _370;
    return out;
}

