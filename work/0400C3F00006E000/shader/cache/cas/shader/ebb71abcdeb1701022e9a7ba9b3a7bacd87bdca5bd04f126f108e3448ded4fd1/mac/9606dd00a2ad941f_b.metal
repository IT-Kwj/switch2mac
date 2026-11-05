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
    constant _16* fp_c4 [[id(1)]];
    texture3d<float> fp_t_tcb_8 [[id(2)]];
    sampler fp_t_tcb_8Smplr [[id(3)]];
    sampler fp_t_tcb_8Smplr_w [[id(4)]];
    constant dm_border_t* dm_border [[id(5)]];
};

struct main0_out
{
    float4 m_34 [[color(0)]];
};

struct main0_in
{
    float4 m_31 [[user(locn0)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _41 = gl_FragCoord.w;
    float _43 = in.m_31.y;
    float _45 = gl_FragCoord.w;
    float _47 = _43 * _45;
    float _49 = in.m_31.x;
    float _51 = gl_FragCoord.w;
    float _53 = _49 * _51;
    float _55 = exp2((*spvDescriptorSet0.fp_c3)._m0[0].y);
    float _57 = exp2((*spvDescriptorSet0.fp_c3)._m0[0].z);
    float _59 = exp2((*spvDescriptorSet0.fp_c3)._m0[0].x);
    float _61 = 1.0 / _55;
    float _63 = fma(_57, (*spvDescriptorSet0.fp_c3)._m0[0].w, (*spvDescriptorSet0.fp_c3)._m0[1].z);
    float _65 = _63 + 33.40000152587890625;
    float _67 = 1.0 / _41;
    float _69 = 1.0 / _57;
    float _71 = _63 + 74.1999969482421875;
    float _73 = _65 * _61;
    float _75 = 1.0 / _59;
    float _77 = _67 * _47;
    float _79 = _67 * _53;
    float _81 = fma(_77, _55, (*spvDescriptorSet0.fp_c3)._m0[1].y);
    float _83 = fma(_79, _59, (*spvDescriptorSet0.fp_c3)._m0[1].x);
    float _85 = _63 * _69;
    float _87 = _81 * _61;
    float _89 = _83 + 47.200000762939453125;
    float _91 = floor(_73);
    float _93 = _89 * _69;
    float _95 = _71 * _75;
    float _97 = _83 * _75;
    float _99 = floor(_87);
    float _101 = _81 + 99.40000152587890625;
    float _103 = _101 * _69;
    float _105 = floor(_85);
    float _107 = _81 + (-19.1000003814697265625);
    float _109 = -_91;
    float _111 = fma(_55, _109, _65);
    float _113 = floor(_95);
    float _115 = _83 + (-124.5);
    float _117 = -_99;
    float _119 = fma(_55, _117, _81);
    float _121 = _115 * _61;
    float _123 = floor(_93);
    float _125 = _107 * _75;
    float _127 = -_105;
    float _129 = fma(_57, _127, _63);
    float _131 = floor(_97);
    float _133 = -_113;
    float _135 = fma(_59, _133, _71);
    float _137 = floor(_125);
    float _139 = -_123;
    float _141 = fma(_57, _139, _89);
    float _143 = _141 * _69;
    float _145 = _135 * _75;
    float _147 = floor(_121);
    float _149 = -_131;
    float _151 = fma(_59, _149, _83);
    float _153 = _143 + (*spvDescriptorSet0.fp_c4)._m0[0].x;
    float _155 = -(*spvDescriptorSet0.fp_c4)._m0[0].x;
    float _157 = _143 + _155;
    float _159 = floor(_103);
    float _161 = -_137;
    float _163 = fma(_59, _161, _107);
    float _165 = -_147;
    float _167 = fma(_55, _165, _115);
    float _169 = _119 * _61;
    float _171 = _151 * _75;
    float _173 = _163 * _75;
    float _175 = _129 * _69;
    float _177 = _169 + (*spvDescriptorSet0.fp_c4)._m0[0].y;
    float _179 = -_159;
    float _181 = fma(_57, _179, _101);
    float _183 = -(*spvDescriptorSet0.fp_c4)._m0[0].y;
    float _185 = _169 + _183;
    float _187 = _181 * _69;
    float _189 = _111 * _61;
    float _191 = _167 * _61;
    float _193 = _187 + (*spvDescriptorSet0.fp_c4)._m0[0].y;
    float _195 = -(*spvDescriptorSet0.fp_c4)._m0[0].z;
    float _197 = _189 + _195;
    float _199 = _189 + (*spvDescriptorSet0.fp_c4)._m0[0].z;
    float3 _524 = float3(_173, _189, _153);
    float _201 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_524, float3(0.0), isnan(_524))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_524, float3(0.0), isnan(_524))).x;
    float3 _537 = float3(_173, _189, _157);
    float _203 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_537, float3(0.0), isnan(_537))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_537, float3(0.0), isnan(_537))).x;
    float3 _546 = float3(_173, _199, _143);
    float _205 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_546, float3(0.0), isnan(_546))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_546, float3(0.0), isnan(_546))).x;
    float3 _555 = float3(_173, _197, _143);
    float _207 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_555, float3(0.0), isnan(_555))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_555, float3(0.0), isnan(_555))).x;
    float3 _564 = float3(_145, _191, _193);
    float _209 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_564, float3(0.0), isnan(_564))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_564, float3(0.0), isnan(_564))).x;
    float _211 = -(*spvDescriptorSet0.fp_c4)._m0[0].y;
    float _213 = _187 + _211;
    float _215 = _191 + (*spvDescriptorSet0.fp_c4)._m0[0].x;
    float _217 = -(*spvDescriptorSet0.fp_c4)._m0[0].x;
    float _219 = _191 + _217;
    float3 _589 = float3(_145, _191, _213);
    float _221 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_589, float3(0.0), isnan(_589))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_589, float3(0.0), isnan(_589))).x;
    float _223 = _175 + (*spvDescriptorSet0.fp_c4)._m0[0].z;
    float3 _602 = float3(_145, _219, _187);
    float _225 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_602, float3(0.0), isnan(_602))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_602, float3(0.0), isnan(_602))).x;
    float3 _611 = float3(_145, _215, _187);
    float _227 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_611, float3(0.0), isnan(_611))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_611, float3(0.0), isnan(_611))).x;
    float3 _620 = float3(_171, _185, _175);
    float _229 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_620, float3(0.0), isnan(_620))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_620, float3(0.0), isnan(_620))).x;
    float3 _629 = float3(_171, _177, _175);
    float _231 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_629, float3(0.0), isnan(_629))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_629, float3(0.0), isnan(_629))).x;
    float3 _638 = float3(_171, _169, _223);
    float _233 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_638, float3(0.0), isnan(_638))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_638, float3(0.0), isnan(_638))).x;
    float _235 = -(*spvDescriptorSet0.fp_c4)._m0[0].z;
    float _237 = _175 + _235;
    float3 _653 = float3(_171, _169, _237);
    float _239 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_653, float3(0.0), isnan(_653))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_653, float3(0.0), isnan(_653))).x;
    float _241 = 0.5 * (*spvDescriptorSet0.fp_c4)._m0[0].w;
    float _243 = -_203;
    float _245 = _201 + _243;
    float _247 = -_205;
    float _249 = _247 + _207;
    float _251 = -_221;
    float _253 = _209 + _251;
    float _255 = -_227;
    float _257 = _255 + _225;
    float _259 = _253 + _249;
    float _261 = -_231;
    float _263 = _261 + _229;
    float _265 = fma(_259, _241, 0.5);
    float _267 = _245 + _263;
    float _269 = -_239;
    float _271 = _233 + _269;
    float _273 = fma(_267, _241, 0.5);
    float _275 = _271 + _257;
    float _277 = fma(_275, _241, 0.5);
    out.m_34.x = _265;
    out.m_34.y = _277;
    out.m_34.z = _273;
    out.m_34.w = 1.0;
    return out;
}

