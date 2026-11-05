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
    constant _16* fp_c5 [[id(0)]];
    constant _16* fp_c4 [[id(1)]];
    constant _16* fp_c3 [[id(2)]];
    texture2d<float> fp_t_tcb_8 [[id(3)]];
    sampler fp_t_tcb_8Smplr [[id(4)]];
    sampler fp_t_tcb_8Smplr_w [[id(5)]];
    constant dm_border_t* dm_border [[id(6)]];
};

struct main0_out
{
    float4 m_36 [[color(0)]];
    float4 m_38 [[color(1)]];
};

struct main0_in
{
    float4 m_33 [[user(locn0)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _45 = gl_FragCoord.w;
    float _47 = in.m_33.x;
    float _49 = gl_FragCoord.w;
    float _51 = _47 * _49;
    float _53 = in.m_33.y;
    float _55 = gl_FragCoord.w;
    float _57 = _53 * _55;
    float _59 = 1.0 / _45;
    float _61 = _59 * _51;
    float _63 = _59 * _57;
    float2 _301 = float2(_61, _63);
    float3 _67 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_301, float2(0.0), isnan(_301))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_301, float2(0.0), isnan(_301))).xyz;
    float _69 = _67.x;
    float _71 = _67.y;
    float _73 = _67.z;
    float _75 = (*spvDescriptorSet0.fp_c5)._m0[0].x * (*spvDescriptorSet0.fp_c5)._m0[0].x;
    float _77 = fma(_75, 0.75, 7.4999996286351233720779418945312e-05);
    float _79 = _75 + 9.9999997473787516355514526367188e-05;
    float _81 = -_77;
    float _83 = _81 + 1.0;
    float _85 = _79 * _83;
    float _87 = _75 + (-0.99989998340606689453125);
    float _89 = _71 * (*spvDescriptorSet0.fp_c4)._m0[1].y;
    float _91 = _71 * (*spvDescriptorSet0.fp_c4)._m0[2].y;
    float _93 = fma(_69, (*spvDescriptorSet0.fp_c4)._m0[1].x, _89);
    float _95 = fma(_69, (*spvDescriptorSet0.fp_c4)._m0[2].x, _91);
    float _97 = fma(_73, (*spvDescriptorSet0.fp_c4)._m0[1].z, _93);
    float _99 = fma(_97, -0.5, 0.5);
    float _101 = (*spvDescriptorSet0.fp_c5)._m0[1].x * (*spvDescriptorSet0.fp_c5)._m0[1].x;
    float _103 = -_73;
    float _105 = fma(_103, (*spvDescriptorSet0.fp_c4)._m0[1].z, _93);
    float _107 = _99 * _99;
    float _109 = fma(_101, 0.75, 7.4999996286351233720779418945312e-05);
    float _111 = fma(_105, -0.5, 0.5);
    float _113 = _101 + 9.9999997473787516355514526367188e-05;
    float _115 = fma(_107, _87, 1.0);
    float _117 = -_109;
    float _119 = _117 + 1.0;
    float _121 = fma(_73, (*spvDescriptorSet0.fp_c4)._m0[2].z, _95);
    float _123 = _111 * _111;
    float _125 = _101 + (-0.99989998340606689453125);
    float _127 = _113 * _119;
    float _129 = -_73;
    float _131 = fma(_129, (*spvDescriptorSet0.fp_c4)._m0[2].z, _95);
    float _133 = fma(_121, -0.5, 0.5);
    float _135 = fma(_87, _123, 1.0);
    float _137 = abs(_73);
    float _139 = -_137;
    float _141 = _139 + 1.0;
    float _143 = fma(_131, -0.5, 0.5);
    float _145 = _133 * _133;
    float _147 = _115 * _115;
    float _149 = _135 * _135;
    float _151 = _143 * _143;
    float _153 = fma(_145, _125, 1.0);
    float _155 = _141 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _157 = precise::clamp(_155, 0.0, 1.0);
    float _159 = _143 + _111;
    float _161 = fma(_125, _151, 1.0);
    float _163 = _153 * _153;
    float _165 = 1.0 / _147;
    float _167 = _133 + _99;
    float _169 = _161 * _161;
    float _171 = 1.0 / _149;
    float _173 = -(*spvDescriptorSet0.fp_c5)._m0[16].y;
    float _175 = _173 + (*spvDescriptorSet0.fp_c5)._m0[17].y;
    float _177 = abs(_157);
    float _179 = log2(_177);
    float _181 = _165 * _85;
    float _183 = fma(_181, _175, (*spvDescriptorSet0.fp_c5)._m0[16].y);
    float _185 = 1.0 / _163;
    float _187 = _171 * _85;
    float _189 = fma(_175, _187, (*spvDescriptorSet0.fp_c5)._m0[16].y);
    float _191 = 1.0 / _169;
    float _193 = _179 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
    float _195 = -(*spvDescriptorSet0.fp_c5)._m0[18].x;
    float _197 = _195 + (*spvDescriptorSet0.fp_c5)._m0[19].x;
    float _199 = -(*spvDescriptorSet0.fp_c5)._m0[18].y;
    float _201 = _199 + (*spvDescriptorSet0.fp_c5)._m0[19].y;
    float _203 = _185 * _127;
    float _205 = exp2(_193);
    float _207 = fma(_203, _201, (*spvDescriptorSet0.fp_c5)._m0[18].y);
    float _209 = -(*spvDescriptorSet0.fp_c5)._m0[16].x;
    float _211 = _209 + (*spvDescriptorSet0.fp_c5)._m0[17].x;
    float _213 = _191 * _127;
    float _215 = fma(_181, _211, (*spvDescriptorSet0.fp_c5)._m0[16].x);
    float _217 = fma(_211, _187, (*spvDescriptorSet0.fp_c5)._m0[16].x);
    float _219 = fma(_203, _197, (*spvDescriptorSet0.fp_c5)._m0[18].x);
    float _221 = -(*spvDescriptorSet0.fp_c5)._m0[16].z;
    float _223 = _221 + (*spvDescriptorSet0.fp_c5)._m0[17].z;
    float _225 = fma(_197, _213, (*spvDescriptorSet0.fp_c5)._m0[18].x);
    float _227 = _219 + _215;
    float _229 = fma(_181, _223, (*spvDescriptorSet0.fp_c5)._m0[16].z);
    float _231 = -(*spvDescriptorSet0.fp_c5)._m0[18].z;
    float _233 = _231 + (*spvDescriptorSet0.fp_c5)._m0[19].z;
    float _235 = fma(_223, _187, (*spvDescriptorSet0.fp_c5)._m0[16].z);
    float _237 = fma(_201, _213, (*spvDescriptorSet0.fp_c5)._m0[18].y);
    float _239 = _207 + _183;
    float _241 = fma(_203, _233, (*spvDescriptorSet0.fp_c5)._m0[18].z);
    float _243 = fma(_233, _213, (*spvDescriptorSet0.fp_c5)._m0[18].z);
    float _245 = _225 + _217;
    float _247 = _237 + _189;
    float _249 = _241 + _229;
    float _251 = _243 + _235;
    float _253 = fma(_205, (*spvDescriptorSet0.fp_c4)._m0[0].x, _227);
    float _255 = fma(_205, (*spvDescriptorSet0.fp_c4)._m0[0].y, _239);
    float _257 = fma(_205, (*spvDescriptorSet0.fp_c4)._m0[0].w, _167);
    float _259 = fma(_205, (*spvDescriptorSet0.fp_c4)._m0[0].w, _159);
    float _261 = fma(_205, (*spvDescriptorSet0.fp_c4)._m0[0].x, _245);
    float _263 = fma(_205, (*spvDescriptorSet0.fp_c4)._m0[0].z, _249);
    float _265 = fma(_205, (*spvDescriptorSet0.fp_c4)._m0[0].y, _247);
    float _267 = fma(_205, (*spvDescriptorSet0.fp_c4)._m0[0].z, _251);
    out.m_36.x = _253;
    out.m_36.y = _255;
    out.m_36.z = _263;
    out.m_36.w = _257;
    out.m_38.x = _261;
    out.m_38.y = _265;
    out.m_38.z = _267;
    out.m_38.w = _259;
    return out;
}

