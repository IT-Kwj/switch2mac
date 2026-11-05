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
    sampler fp_t_tcb_8Smplr_w [[id(3)]];
    constant dm_border_t* dm_border [[id(4)]];
};

struct main0_out
{
    float4 m_32 [[color(0)]];
};

struct main0_in
{
    float4 m_29 [[user(locn0)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _39 = gl_FragCoord.w;
    float _41 = in.m_29.x;
    float _43 = gl_FragCoord.w;
    float _45 = _41 * _43;
    float _47 = in.m_29.y;
    float _49 = gl_FragCoord.w;
    float _51 = _47 * _49;
    float _53 = 1.0 / _39;
    float _55 = _53 * _45;
    float _57 = _53 * _51;
    float _59 = -(*spvDescriptorSet0.fp_c3)._m0[29].x;
    float _61 = fma(3.230770111083984375, _59, _55);
    float _63 = -(*spvDescriptorSet0.fp_c3)._m0[29].y;
    float _65 = fma(3.230770111083984375, _63, _57);
    float _67 = -(*spvDescriptorSet0.fp_c3)._m0[29].x;
    float _69 = fma(5.076900005340576171875, _67, _55);
    float _71 = -(*spvDescriptorSet0.fp_c3)._m0[29].y;
    float _73 = fma(5.076900005340576171875, _71, _57);
    float _75 = -(*spvDescriptorSet0.fp_c3)._m0[29].x;
    float _77 = fma(1.38460004329681396484375, _75, _55);
    float _79 = -(*spvDescriptorSet0.fp_c3)._m0[29].y;
    float _81 = fma(1.38460004329681396484375, _79, _57);
    float _83 = fma(1.38460004329681396484375, (*spvDescriptorSet0.fp_c3)._m0[29].x, _55);
    float2 _308 = float2(_61, _65);
    float4 _86 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_308, float2(0.0), isnan(_308))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_308, float2(0.0), isnan(_308))).xyzw;
    float _88 = _86.x;
    float _90 = _86.y;
    float _92 = _86.z;
    float _94 = _86.w;
    float _96 = fma(1.38460004329681396484375, (*spvDescriptorSet0.fp_c3)._m0[29].y, _57);
    float2 _332 = float2(_69, _73);
    float4 _98 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_332, float2(0.0), isnan(_332))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_332, float2(0.0), isnan(_332))).xyzw;
    float _100 = _98.x;
    float _102 = _98.y;
    float _104 = _98.z;
    float _106 = _98.w;
    float _108 = fma(3.230770111083984375, (*spvDescriptorSet0.fp_c3)._m0[29].x, _55);
    float2 _352 = float2(_77, _81);
    float4 _110 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_352, float2(0.0), isnan(_352))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_352, float2(0.0), isnan(_352))).xyzw;
    float _112 = _110.x;
    float _114 = _110.y;
    float _116 = _110.z;
    float _118 = _110.w;
    float _120 = fma(5.076900005340576171875, (*spvDescriptorSet0.fp_c3)._m0[29].x, _55);
    float _122 = fma(3.230770111083984375, (*spvDescriptorSet0.fp_c3)._m0[29].y, _57);
    float _124 = fma(5.076900005340576171875, (*spvDescriptorSet0.fp_c3)._m0[29].y, _57);
    float2 _380 = float2(_55, _57);
    float4 _126 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_380, float2(0.0), isnan(_380))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_380, float2(0.0), isnan(_380))).xyzw;
    float _128 = _126.x;
    float _130 = _126.y;
    float _132 = _126.z;
    float _134 = _126.w;
    float2 _396 = float2(_83, _96);
    float4 _136 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_396, float2(0.0), isnan(_396))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_396, float2(0.0), isnan(_396))).xyzw;
    float _138 = _136.x;
    float _140 = _136.y;
    float _142 = _136.z;
    float _144 = _136.w;
    float2 _412 = float2(_108, _122);
    float4 _146 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_412, float2(0.0), isnan(_412))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_412, float2(0.0), isnan(_412))).xyzw;
    float _148 = _146.x;
    float _150 = _146.y;
    float _152 = _146.z;
    float _154 = _146.w;
    float2 _428 = float2(_120, _124);
    float4 _156 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_428, float2(0.0), isnan(_428))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_428, float2(0.0), isnan(_428))).xyzw;
    float _158 = _156.x;
    float _160 = _156.y;
    float _162 = _156.z;
    float _164 = _156.w;
    float _166 = _92 * 286.0;
    float _168 = _88 * 286.0;
    float _170 = _90 * 286.0;
    float _172 = _94 * 286.0;
    float _174 = fma(_104, 13.0, _166);
    float _176 = fma(_100, 13.0, _168);
    float _178 = fma(_102, 13.0, _170);
    float _180 = fma(_106, 13.0, _172);
    float _182 = fma(_116, 1287.0, _174);
    float _184 = fma(_112, 1287.0, _176);
    float _186 = fma(_114, 1287.0, _178);
    float _188 = fma(_118, 1287.0, _180);
    float _190 = fma(_132, 924.0, _182);
    float _192 = fma(_128, 924.0, _184);
    float _194 = fma(_130, 924.0, _186);
    float _196 = fma(_134, 924.0, _188);
    float _198 = fma(_142, 1287.0, _190);
    float _200 = fma(_138, 1287.0, _192);
    float _202 = fma(_140, 1287.0, _194);
    float _204 = fma(_144, 1287.0, _196);
    float _206 = fma(_152, 286.0, _198);
    float _208 = fma(_148, 286.0, _200);
    float _210 = fma(_150, 286.0, _202);
    float _212 = fma(_154, 286.0, _204);
    float _214 = fma(_162, 13.0, _206);
    float _216 = fma(_158, 13.0, _208);
    float _218 = fma(_160, 13.0, _210);
    float _220 = fma(_164, 13.0, _212);
    float _222 = _214 * 0.000244140625;
    float _224 = _216 * 0.000244140625;
    float _226 = _218 * 0.000244140625;
    float _228 = _220 * 0.000244140625;
    out.m_32.x = _224;
    out.m_32.y = _226;
    out.m_32.z = _222;
    out.m_32.w = _228;
    return out;
}

