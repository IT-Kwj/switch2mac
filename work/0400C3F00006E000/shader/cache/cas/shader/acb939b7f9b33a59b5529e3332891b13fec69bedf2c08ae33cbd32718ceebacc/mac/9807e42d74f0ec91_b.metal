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

struct spvDescriptorSetBuffer0
{
    texture2d<float> fp_t_tcb_8 [[id(0)]];
    sampler fp_t_tcb_8Smplr [[id(1)]];
    sampler fp_t_tcb_8Smplr_w [[id(2)]];
    constant dm_border_t* dm_border [[id(3)]];
};

struct main0_out
{
    float4 m_32 [[color(0)]];
};

struct main0_in
{
    float4 m_27 [[user(locn0)]];
    float4 m_23 [[user(locn1)]];
    float4 m_25 [[user(locn2)]];
    float4 m_29 [[user(locn3)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _39 = gl_FragCoord.w;
    float _41 = in.m_23.x;
    float _43 = gl_FragCoord.w;
    float _45 = _41 * _43;
    float _47 = in.m_23.y;
    float _49 = gl_FragCoord.w;
    float _51 = _47 * _49;
    float _53 = in.m_25.z;
    float _55 = gl_FragCoord.w;
    float _57 = _53 * _55;
    float _59 = in.m_23.z;
    float _61 = gl_FragCoord.w;
    float _63 = _59 * _61;
    float _65 = in.m_25.x;
    float _67 = gl_FragCoord.w;
    float _69 = _65 * _67;
    float _71 = in.m_25.y;
    float _73 = gl_FragCoord.w;
    float _75 = _71 * _73;
    float _77 = in.m_27.x;
    float _79 = gl_FragCoord.w;
    float _81 = _77 * _79;
    float _83 = in.m_27.y;
    float _85 = gl_FragCoord.w;
    float _87 = _83 * _85;
    float _89 = in.m_25.w;
    float _91 = gl_FragCoord.w;
    float _93 = _89 * _91;
    float _95 = in.m_23.w;
    float _97 = gl_FragCoord.w;
    float _99 = _95 * _97;
    float _101 = in.m_27.z;
    float _103 = gl_FragCoord.w;
    float _105 = _101 * _103;
    float _107 = in.m_27.w;
    float _109 = gl_FragCoord.w;
    float _111 = _107 * _109;
    float _113 = in.m_29.x;
    float _115 = gl_FragCoord.w;
    float _117 = _113 * _115;
    float _119 = in.m_29.y;
    float _121 = gl_FragCoord.w;
    float _123 = _119 * _121;
    float _125 = 1.0 / _39;
    float _127 = _125 * _45;
    float _129 = _125 * _51;
    float _131 = _125 * _57;
    float _133 = _125 * _63;
    float _135 = _125 * _69;
    float _137 = _125 * _75;
    float _139 = _125 * _81;
    float _141 = _125 * _87;
    float _143 = _125 * _93;
    float _145 = _125 * _99;
    float _147 = _125 * _105;
    float _149 = _125 * _111;
    float _151 = _125 * _117;
    float _153 = _125 * _123;
    float2 _443 = float2(_127, _129);
    float4 _156 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_443, float2(0.0), isnan(_443))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_443, float2(0.0), isnan(_443))).xyzw;
    float _158 = _156.x;
    float _160 = _156.y;
    float _162 = _156.z;
    float _164 = _156.w;
    float2 _463 = float2(_135, _137);
    float4 _166 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_463, float2(0.0), isnan(_463))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_463, float2(0.0), isnan(_463))).xyzw;
    float _168 = _166.x;
    float _170 = _166.y;
    float _172 = _166.z;
    float _174 = _166.w;
    float2 _479 = float2(_139, _141);
    float4 _176 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_479, float2(0.0), isnan(_479))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_479, float2(0.0), isnan(_479))).xyzw;
    float _178 = _176.x;
    float _180 = _176.y;
    float _182 = _176.z;
    float _184 = _176.w;
    float2 _495 = float2(_151, _153);
    float4 _186 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_495, float2(0.0), isnan(_495))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_495, float2(0.0), isnan(_495))).xyzw;
    float _188 = _186.x;
    float _190 = _186.y;
    float _192 = _186.z;
    float _194 = _186.w;
    float2 _511 = float2(_147, _149);
    float4 _196 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_511, float2(0.0), isnan(_511))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_511, float2(0.0), isnan(_511))).xyzw;
    float _198 = _196.x;
    float _200 = _196.y;
    float _202 = _196.z;
    float _204 = _196.w;
    float2 _527 = float2(_133, _145);
    float4 _206 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_527, float2(0.0), isnan(_527))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_527, float2(0.0), isnan(_527))).xyzw;
    float _208 = _206.x;
    float _210 = _206.y;
    float _212 = _206.z;
    float _214 = _206.w;
    float2 _543 = float2(_131, _143);
    float4 _216 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_543, float2(0.0), isnan(_543))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_543, float2(0.0), isnan(_543))).xyzw;
    float _218 = _216.x;
    float _220 = _216.y;
    float _222 = _216.z;
    float _224 = _216.w;
    float _226 = _162 * 286.0;
    float _228 = _158 * 286.0;
    float _230 = _160 * 286.0;
    float _232 = _164 * 286.0;
    float _234 = fma(_172, 13.0, _226);
    float _236 = fma(_168, 13.0, _228);
    float _238 = fma(_170, 13.0, _230);
    float _240 = fma(_174, 13.0, _232);
    float _242 = fma(_182, 1287.0, _234);
    float _244 = fma(_178, 1287.0, _236);
    float _246 = fma(_180, 1287.0, _238);
    float _248 = fma(_184, 1287.0, _240);
    float _250 = fma(_192, 924.0, _242);
    float _252 = fma(_188, 924.0, _244);
    float _254 = fma(_190, 924.0, _246);
    float _256 = fma(_194, 924.0, _248);
    float _258 = fma(_202, 1287.0, _250);
    float _260 = fma(_198, 1287.0, _252);
    float _262 = fma(_200, 1287.0, _254);
    float _264 = fma(_204, 1287.0, _256);
    float _266 = fma(_212, 286.0, _258);
    float _268 = fma(_208, 286.0, _260);
    float _270 = fma(_210, 286.0, _262);
    float _272 = fma(_214, 286.0, _264);
    float _274 = fma(_222, 13.0, _266);
    float _276 = fma(_218, 13.0, _268);
    float _278 = fma(_220, 13.0, _270);
    float _280 = fma(_224, 13.0, _272);
    float _282 = _274 * 0.000245700008235871791839599609375;
    float _284 = _276 * 0.000245700008235871791839599609375;
    float _286 = _278 * 0.000245700008235871791839599609375;
    float _288 = _280 * 0.000245700008235871791839599609375;
    out.m_32.x = _284;
    out.m_32.y = _286;
    out.m_32.z = _282;
    out.m_32.w = _288;
    return out;
}

