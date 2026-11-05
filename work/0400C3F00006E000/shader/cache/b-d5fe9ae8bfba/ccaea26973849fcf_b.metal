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
    texture2d<float> fp_t_tcb_8 [[id(2)]];
    sampler fp_t_tcb_8Smplr [[id(3)]];
    sampler fp_t_tcb_8Smplr_w [[id(4)]];
    constant dm_border_t* dm_border [[id(5)]];
};

struct main0_out
{
    float4 m_34 [[color(0)]];
    float4 m_36 [[color(1)]];
    float4 m_38 [[color(2)]];
    float4 m_40 [[color(3)]];
    float4 m_42 [[color(4)]];
    float4 m_44 [[color(5)]];
};

struct main0_in
{
    float4 m_31 [[user(locn0)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _51 = gl_FragCoord.w;
    float _53 = in.m_31.x;
    float _55 = gl_FragCoord.w;
    float _57 = _53 * _55;
    float _59 = in.m_31.y;
    float _61 = gl_FragCoord.w;
    float _63 = _59 * _61;
    float _65 = 1.0 / _51;
    float _67 = _65 * _57;
    float _69 = _65 * _63;
    float2 _351 = float2(_67, _69);
    float3 _73 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_351, float2(0.0), isnan(_351))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_351, float2(0.0), isnan(_351))).xyz;
    float _75 = _73.x;
    float _77 = _73.y;
    float _79 = _73.z;
    float _81 = (*spvDescriptorSet0.fp_c5)._m0[0].x * (*spvDescriptorSet0.fp_c5)._m0[0].x;
    float _83 = fma(_81, 0.75, 7.4999996286351233720779418945312e-05);
    float _85 = _81 + 9.9999997473787516355514526367188e-05;
    float _87 = -(*spvDescriptorSet0.fp_c5)._m0[16].y;
    float _89 = _87 + (*spvDescriptorSet0.fp_c5)._m0[17].y;
    float _91 = -_83;
    float _93 = _91 + 1.0;
    float _95 = -(*spvDescriptorSet0.fp_c5)._m0[16].z;
    float _97 = _95 + (*spvDescriptorSet0.fp_c5)._m0[17].z;
    float _99 = _85 * _93;
    float _101 = _77 * (*spvDescriptorSet0.fp_c4)._m0[1].y;
    float _103 = _79 * (*spvDescriptorSet0.fp_c4)._m0[1].x;
    float _105 = fma(_75, (*spvDescriptorSet0.fp_c4)._m0[1].x, _101);
    float _107 = -_75;
    float _109 = fma(_107, (*spvDescriptorSet0.fp_c4)._m0[1].x, _101);
    float _111 = -_103;
    float _113 = fma(_75, (*spvDescriptorSet0.fp_c4)._m0[1].y, _111);
    float _115 = -_79;
    float _117 = fma(_115, (*spvDescriptorSet0.fp_c4)._m0[1].z, _105);
    float _119 = fma(_77, (*spvDescriptorSet0.fp_c4)._m0[1].z, _113);
    float _121 = fma(_117, -0.5, 0.5);
    float _123 = fma(_79, (*spvDescriptorSet0.fp_c4)._m0[1].z, _109);
    float _125 = _81 + (-0.99989998340606689453125);
    float _127 = fma(_119, -0.5, 0.5);
    float _129 = _121 * _121;
    float _131 = fma(_123, -0.5, 0.5);
    float _133 = -_75;
    float _135 = -_103;
    float _137 = fma(_133, (*spvDescriptorSet0.fp_c4)._m0[1].y, _135);
    float _139 = _127 * _127;
    float _141 = fma(_129, _125, 1.0);
    float _143 = _131 * _131;
    float _145 = -_77;
    float _147 = fma(_145, (*spvDescriptorSet0.fp_c4)._m0[1].z, _137);
    float _149 = fma(_125, _139, 1.0);
    float _151 = _141 * _141;
    float _153 = fma(_125, _143, 1.0);
    float _155 = fma(_147, -0.5, 0.5);
    float _157 = _149 * _149;
    float _159 = 0.0 + _121;
    float _161 = precise::clamp(_159, 0.0, 1.0);
    float _163 = _153 * _153;
    float _165 = -_103;
    float _167 = _101 + _165;
    float _169 = _101 + _103;
    float _171 = 1.0 / _151;
    float _173 = 0.0 + _131;
    float _175 = precise::clamp(_173, 0.0, 1.0);
    float _177 = -_75;
    float _179 = fma(_177, (*spvDescriptorSet0.fp_c4)._m0[1].z, _167);
    float _181 = fma(_75, (*spvDescriptorSet0.fp_c4)._m0[1].z, _169);
    float _183 = _155 * _155;
    float _185 = 0.0 + _127;
    float _187 = precise::clamp(_185, 0.0, 1.0);
    float _189 = fma(_179, -0.5, 0.5);
    float _191 = fma(_181, -0.5, 0.5);
    float _193 = fma(_125, _183, 1.0);
    float _195 = 1.0 / _163;
    float _197 = _189 * _189;
    float _199 = _191 * _191;
    float _201 = _193 * _193;
    float _203 = 0.0 + _155;
    float _205 = precise::clamp(_203, 0.0, 1.0);
    float _207 = fma(_125, _197, 1.0);
    float _209 = fma(_125, _199, 1.0);
    float _211 = _171 * _99;
    float _213 = 1.0 / _157;
    float _215 = _207 * _207;
    float _217 = _209 * _209;
    float _219 = 0.0 + _189;
    float _221 = precise::clamp(_219, 0.0, 1.0);
    float _223 = 0.0 + _191;
    float _225 = precise::clamp(_223, 0.0, 1.0);
    float _227 = 1.0 / _201;
    float _229 = _195 * _99;
    float _231 = -(*spvDescriptorSet0.fp_c5)._m0[16].x;
    float _233 = _231 + (*spvDescriptorSet0.fp_c5)._m0[17].x;
    float _235 = fma(_211, _89, (*spvDescriptorSet0.fp_c5)._m0[16].y);
    float _237 = precise::clamp(_235, 0.0, 1.0);
    float _239 = fma(_89, _229, (*spvDescriptorSet0.fp_c5)._m0[16].y);
    float _241 = precise::clamp(_239, 0.0, 1.0);
    float _243 = fma(_233, _229, (*spvDescriptorSet0.fp_c5)._m0[16].x);
    float _245 = precise::clamp(_243, 0.0, 1.0);
    float _247 = fma(_97, _229, (*spvDescriptorSet0.fp_c5)._m0[16].z);
    float _249 = precise::clamp(_247, 0.0, 1.0);
    float _251 = 1.0 / _215;
    float _253 = _213 * _99;
    float _255 = fma(_233, _253, (*spvDescriptorSet0.fp_c5)._m0[16].x);
    float _257 = precise::clamp(_255, 0.0, 1.0);
    float _259 = 1.0 / _217;
    float _261 = _227 * _99;
    float _263 = fma(_233, _261, (*spvDescriptorSet0.fp_c5)._m0[16].x);
    float _265 = precise::clamp(_263, 0.0, 1.0);
    float _267 = fma(_89, _261, (*spvDescriptorSet0.fp_c5)._m0[16].y);
    float _269 = precise::clamp(_267, 0.0, 1.0);
    float _271 = fma(_97, _261, (*spvDescriptorSet0.fp_c5)._m0[16].z);
    float _273 = precise::clamp(_271, 0.0, 1.0);
    float _275 = _251 * _99;
    float _277 = fma(_211, _233, (*spvDescriptorSet0.fp_c5)._m0[16].x);
    float _279 = precise::clamp(_277, 0.0, 1.0);
    float _281 = fma(_89, _253, (*spvDescriptorSet0.fp_c5)._m0[16].y);
    float _283 = precise::clamp(_281, 0.0, 1.0);
    float _285 = fma(_211, _97, (*spvDescriptorSet0.fp_c5)._m0[16].z);
    float _287 = precise::clamp(_285, 0.0, 1.0);
    float _289 = fma(_233, _275, (*spvDescriptorSet0.fp_c5)._m0[16].x);
    float _291 = precise::clamp(_289, 0.0, 1.0);
    float _293 = fma(_97, _253, (*spvDescriptorSet0.fp_c5)._m0[16].z);
    float _295 = precise::clamp(_293, 0.0, 1.0);
    float _297 = _259 * _99;
    float _299 = fma(_233, _297, (*spvDescriptorSet0.fp_c5)._m0[16].x);
    float _301 = precise::clamp(_299, 0.0, 1.0);
    float _303 = fma(_89, _275, (*spvDescriptorSet0.fp_c5)._m0[16].y);
    float _305 = precise::clamp(_303, 0.0, 1.0);
    float _307 = fma(_97, _275, (*spvDescriptorSet0.fp_c5)._m0[16].z);
    float _309 = precise::clamp(_307, 0.0, 1.0);
    float _311 = fma(_89, _297, (*spvDescriptorSet0.fp_c5)._m0[16].y);
    float _313 = precise::clamp(_311, 0.0, 1.0);
    float _315 = fma(_97, _297, (*spvDescriptorSet0.fp_c5)._m0[16].z);
    float _317 = precise::clamp(_315, 0.0, 1.0);
    out.m_34.x = _279;
    out.m_34.y = _237;
    out.m_34.z = _287;
    out.m_34.w = _161;
    out.m_36.x = _245;
    out.m_36.y = _241;
    out.m_36.z = _249;
    out.m_36.w = _175;
    out.m_38.x = _257;
    out.m_38.y = _283;
    out.m_38.z = _295;
    out.m_38.w = _187;
    out.m_40.x = _265;
    out.m_40.y = _269;
    out.m_40.z = _273;
    out.m_40.w = _205;
    out.m_42.x = _291;
    out.m_42.y = _305;
    out.m_42.z = _309;
    out.m_42.w = _221;
    out.m_44.x = _301;
    out.m_44.y = _313;
    out.m_44.z = _317;
    out.m_44.w = _225;
    return out;
}

