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
    texture2d<float> fp_t_tcb_A [[id(3)]];
    sampler fp_t_tcb_ASmplr [[id(4)]];
    sampler fp_t_tcb_8Smplr_w [[id(5)]];
    constant dm_border_t* dm_border [[id(6)]];
};

struct main0_out
{
    float4 m_38 [[color(0)]];
    float4 m_40 [[color(1)]];
};

struct main0_in
{
    float4 m_31 [[user(locn0)]];
    float4 m_35 [[user(locn1)]];
    float4 m_33 [[user(locn2)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _47 = gl_FragCoord.w;
    float _49 = in.m_31.x;
    float _51 = gl_FragCoord.w;
    float _53 = _49 * _51;
    float _55 = in.m_31.y;
    float _57 = gl_FragCoord.w;
    float _59 = _55 * _57;
    float _61 = in.m_33.x;
    float _63 = gl_FragCoord.w;
    float _65 = _61 * _63;
    float _67 = in.m_33.y;
    float _69 = gl_FragCoord.w;
    float _71 = _67 * _69;
    float _73 = in.m_35.x;
    float _75 = gl_FragCoord.w;
    float _77 = _73 * _75;
    float _79 = in.m_35.w;
    float _81 = gl_FragCoord.w;
    float _83 = _79 * _81;
    float _85 = in.m_31.z;
    float _87 = gl_FragCoord.w;
    float _89 = _85 * _87;
    float _91 = in.m_31.w;
    float _93 = gl_FragCoord.w;
    float _95 = _91 * _93;
    float _97 = in.m_35.y;
    float _99 = gl_FragCoord.w;
    float _101 = _97 * _99;
    float _103 = in.m_35.z;
    float _105 = gl_FragCoord.w;
    float _107 = _103 * _105;
    float _109 = 1.0 / _47;
    float _111 = _109 * _53;
    float _113 = _109 * _59;
    float _115 = _109 * _65;
    float _117 = _109 * _71;
    float _119 = _109 * _77;
    float _121 = _109 * _83;
    float _123 = _109 * _89;
    float _125 = _109 * _95;
    float2 _475 = float2(_111, _113);
    float3 _129 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_475, float2(0.0), isnan(_475))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_475, float2(0.0), isnan(_475))).xyz;
    float _131 = _129.x;
    float _133 = _129.y;
    float _135 = _129.z;
    float2 _493 = float2(_115, _117);
    float3 _137 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_493, float2(0.0), isnan(_493))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_493, float2(0.0), isnan(_493))).xyz;
    float _139 = _137.x;
    float _141 = _137.y;
    float _143 = _137.z;
    float _145 = _109 * _101;
    float _147 = _109 * _107;
    float2 _513 = float2(_123, _125);
    float3 _149 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_513, float2(0.0), isnan(_513))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_513, float2(0.0), isnan(_513))).xyz;
    float _151 = _149.x;
    float _153 = _149.y;
    float _155 = _149.z;
    float2 _527 = float2(_115, _117);
    float4 _158 = spvDescriptorSet0.fp_t_tcb_A.gather(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_527, float2(0.0), isnan(_527)), int2(0), component::x).xyzw;
    float _160 = _158.x;
    float _162 = _158.y;
    float _164 = _158.z;
    float _166 = _158.w;
    float2 _543 = float2(_119, _145);
    float3 _168 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_543, float2(0.0), isnan(_543))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_543, float2(0.0), isnan(_543))).xyz;
    float _170 = _168.x;
    float _172 = _168.y;
    float _174 = _168.z;
    float2 _557 = float2(_147, _121);
    float3 _176 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_557, float2(0.0), isnan(_557))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_557, float2(0.0), isnan(_557))).xyz;
    float _178 = _176.x;
    float _180 = _176.y;
    float _182 = _176.z;
    float _184 = 1.0 / (*spvDescriptorSet0.fp_c3)._m0[2].z;
    float _186 = _143 + _135;
    float _188 = _139 + _131;
    float _190 = _141 + _133;
    float _192 = -_160;
    float _194 = fma(_192, (*spvDescriptorSet0.fp_c3)._m0[2].w, 1.0);
    float _196 = -_162;
    float _198 = fma(_196, (*spvDescriptorSet0.fp_c3)._m0[2].w, 1.0);
    float _200 = _151 + _188;
    float _202 = -_164;
    float _204 = fma(_202, (*spvDescriptorSet0.fp_c3)._m0[2].w, 1.0);
    float _206 = _194 * _184;
    float _208 = _198 * _184;
    float _210 = -_166;
    float _212 = fma(_210, (*spvDescriptorSet0.fp_c3)._m0[2].w, 1.0);
    float _214 = _170 + _200;
    float _216 = fma(_206, (*spvDescriptorSet0.fp_c3)._m0[0].y, -1.0);
    float _218 = _204 * _184;
    float _220 = fma(_208, (*spvDescriptorSet0.fp_c3)._m0[0].y, -1.0);
    float _222 = _153 + _190;
    float _224 = _212 * _184;
    float _226 = -_206;
    float _228 = fma(_226, (*spvDescriptorSet0.fp_c3)._m0[0].z, _216);
    float _230 = -_206;
    float _232 = -_216;
    float _234 = fma(_230, (*spvDescriptorSet0.fp_c3)._m0[0].z, _232);
    float _236 = fma(_218, (*spvDescriptorSet0.fp_c3)._m0[0].y, -1.0);
    float _238 = -_208;
    float _240 = fma(_238, (*spvDescriptorSet0.fp_c3)._m0[0].z, _220);
    float _242 = -_208;
    float _244 = -_220;
    float _246 = fma(_242, (*spvDescriptorSet0.fp_c3)._m0[0].z, _244);
    float _248 = fma(_224, (*spvDescriptorSet0.fp_c3)._m0[0].y, -1.0);
    float _250 = -_218;
    float _252 = fma(_250, (*spvDescriptorSet0.fp_c3)._m0[0].z, _236);
    float _254 = -_218;
    float _256 = -_236;
    float _258 = fma(_254, (*spvDescriptorSet0.fp_c3)._m0[0].z, _256);
    float _260 = -_224;
    float _262 = fma(_260, (*spvDescriptorSet0.fp_c3)._m0[0].z, _248);
    float _264 = -_224;
    float _266 = -_248;
    float _268 = fma(_264, (*spvDescriptorSet0.fp_c3)._m0[0].z, _266);
    float _270 = precise::max(0.0, _234);
    float _272 = (*spvDescriptorSet0.fp_c3)._m0[1].x * (*spvDescriptorSet0.fp_c3)._m0[0].x;
    float _274 = precise::max(0.0, _246);
    float _276 = _155 + _186;
    float _278 = precise::max(0.0, _258);
    float _280 = _270 * _272;
    float _282 = precise::max(0.0, _228);
    float _284 = _274 * _272;
    float _286 = precise::max(0.0, _240);
    float _288 = _278 * _272;
    float _290 = precise::max(0.0, _268);
    float _292 = _282 * _272;
    float _294 = precise::max(_280, -0.00999999977648258209228515625);
    float _296 = _286 * _272;
    float _298 = precise::max(_284, -0.00999999977648258209228515625);
    float _300 = _290 * _272;
    float _302 = precise::max(0.0, _252);
    float _304 = _174 + _276;
    float _306 = precise::max(0.0, _262);
    float _308 = precise::min(_294, (*spvDescriptorSet0.fp_c3)._m0[0].w);
    float _310 = _302 * _272;
    float _312 = precise::min(_298, (*spvDescriptorSet0.fp_c3)._m0[0].w);
    float _314 = _306 * _272;
    float _316 = precise::max(_288, -0.00999999977648258209228515625);
    float _318 = precise::min(_308, _312);
    float _320 = precise::min(_316, (*spvDescriptorSet0.fp_c3)._m0[0].w);
    float _322 = precise::max(_292, -0.00999999977648258209228515625);
    float _324 = precise::max(_296, -0.00999999977648258209228515625);
    float _326 = precise::max(_300, -0.00999999977648258209228515625);
    float _328 = precise::min(_320, _318);
    float _330 = _172 + _222;
    float _332 = precise::min(_322, (*spvDescriptorSet0.fp_c3)._m0[0].w);
    float _334 = precise::min(_324, (*spvDescriptorSet0.fp_c3)._m0[0].w);
    float _336 = precise::min(_326, (*spvDescriptorSet0.fp_c3)._m0[0].w);
    float _338 = precise::max(_310, -0.00999999977648258209228515625);
    float _340 = precise::max(_332, _334);
    float _342 = precise::min(_336, _328);
    float _344 = precise::min(_338, (*spvDescriptorSet0.fp_c3)._m0[0].w);
    float _346 = precise::max(_314, -0.00999999977648258209228515625);
    float _348 = _178 + _214;
    float _350 = precise::max(_344, _340);
    float _352 = _180 + _330;
    float _354 = precise::min(_346, (*spvDescriptorSet0.fp_c3)._m0[0].w);
    float _356 = _342 * 0.20000000298023223876953125;
    float _358 = _182 + _304;
    float _360 = precise::max(_354, _350);
    float _362 = _348 * _356;
    float _364 = _352 * _356;
    float _366 = _358 * _356;
    out.m_38.x = _362;
    out.m_38.y = _364;
    out.m_38.z = _366;
    out.m_38.w = _342;
    out.m_40.x = _360;
    out.m_40.y = _342;
    return out;
}

