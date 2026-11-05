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
    float4 m_46 [[color(0)]];
};

struct main0_in
{
    float4 m_27 [[user(locn0), center_no_perspective]];
    float4 m_43 [[user(locn1)]];
    float4 m_33 [[user(locn3)]];
    float4 m_37 [[user(locn5)]];
    float4 m_35 [[user(locn6)]];
    float4 m_39 [[user(locn7)]];
    float4 m_41 [[user(locn8)]];
    float4 m_31 [[user(locn9)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _53 = in.m_27.x;
    float _55 = in.m_27.y;
    float2 _292 = float2(_53, _55);
    float _57 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_292, float2(0.0), isnan(_292))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_292, float2(0.0), isnan(_292))).x;
    float _59 = gl_FragCoord.w;
    float _61 = in.m_31.y;
    float _63 = gl_FragCoord.w;
    float _65 = _61 * _63;
    float _67 = in.m_31.x;
    float _69 = gl_FragCoord.w;
    float _71 = _67 * _69;
    float _73 = in.m_31.z;
    float _75 = gl_FragCoord.w;
    float _77 = _73 * _75;
    float _79 = in.m_31.w;
    float _81 = gl_FragCoord.w;
    float _83 = _79 * _81;
    float _85 = in.m_33.x;
    float _87 = gl_FragCoord.w;
    float _89 = _85 * _87;
    float _91 = in.m_35.y;
    float _93 = gl_FragCoord.w;
    float _95 = _91 * _93;
    float _97 = in.m_37.y;
    float _99 = gl_FragCoord.w;
    float _101 = _97 * _99;
    float _103 = in.m_33.z;
    float _105 = gl_FragCoord.w;
    float _107 = _103 * _105;
    float _109 = in.m_39.y;
    float _111 = gl_FragCoord.w;
    float _113 = _109 * _111;
    float _115 = in.m_41.y;
    float _117 = gl_FragCoord.w;
    float _119 = _115 * _117;
    float _121 = in.m_43.z;
    float _123 = gl_FragCoord.w;
    float _125 = _121 * _123;
    float _127 = 1.0 / _59;
    float _129 = _127 * _65;
    float _131 = _127 * _71;
    float _133 = _129 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
    float _135 = _129 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
    float _137 = _129 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
    float _139 = _127 * _77;
    float _141 = fma(_131, (*spvDescriptorSet0.fp_c3)._m0[6].x, _133);
    float _143 = fma(_131, (*spvDescriptorSet0.fp_c3)._m0[7].x, _135);
    float _145 = fma(_131, (*spvDescriptorSet0.fp_c3)._m0[8].x, _137);
    float _147 = _127 * _83;
    float _149 = fma(_139, (*spvDescriptorSet0.fp_c3)._m0[6].z, _141);
    float _151 = in.m_33.y;
    float _153 = gl_FragCoord.w;
    float _155 = _151 * _153;
    float _157 = fma(_139, (*spvDescriptorSet0.fp_c3)._m0[8].z, _145);
    float _159 = fma(_139, (*spvDescriptorSet0.fp_c3)._m0[7].z, _143);
    float _161 = fma(_147, (*spvDescriptorSet0.fp_c3)._m0[6].w, _149);
    float _163 = fma(_147, (*spvDescriptorSet0.fp_c3)._m0[8].w, _157);
    float _165 = fma(_147, (*spvDescriptorSet0.fp_c3)._m0[7].w, _159);
    float _167 = 1.0 / _163;
    float _169 = _127 * _155;
    float _171 = -_57;
    float _173 = fma(_171, (*spvDescriptorSet0.fp_c3)._m0[0].y, 1.0);
    float _175 = 1.0 / _173;
    float _177 = -(*spvDescriptorSet0.fp_c3)._m0[0].x;
    float _179 = _175 * _177;
    float _181 = _179 * _167;
    float _183 = _165 * _181;
    float _185 = _161 * _181;
    float _187 = _183 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _189 = _183 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _191 = _183 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
    float _193 = fma(_185, (*spvDescriptorSet0.fp_c3)._m0[3].x, _187);
    float _195 = in.m_43.x;
    float _197 = gl_FragCoord.w;
    float _199 = _195 * _197;
    float _201 = fma(_179, (*spvDescriptorSet0.fp_c3)._m0[3].z, _193);
    float _203 = fma(_185, (*spvDescriptorSet0.fp_c3)._m0[2].x, _189);
    float _205 = fma(_185, (*spvDescriptorSet0.fp_c3)._m0[4].x, _191);
    float _207 = _127 * _89;
    float _209 = _201 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _211 = fma(_179, (*spvDescriptorSet0.fp_c3)._m0[2].z, _203);
    float _213 = _127 * _95;
    float _215 = fma(_179, (*spvDescriptorSet0.fp_c3)._m0[4].z, _205);
    float _217 = -_169;
    float _219 = _209 + _217;
    float _221 = _211 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _223 = in.m_43.y;
    float _225 = gl_FragCoord.w;
    float _227 = _223 * _225;
    float _229 = _127 * _107;
    float _231 = _219 * _213;
    float _233 = -_207;
    float _235 = _221 + _233;
    float _237 = _127 * _101;
    float _239 = _215 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
    float _241 = fma(_235, _237, _231);
    float _243 = -_229;
    float _245 = _239 + _243;
    float _247 = _127 * _113;
    float _249 = fma(_245, _247, _241);
    float _251 = _127 * _119;
    float _253 = _251 + _249;
    float _255 = _127 * _199;
    float _257 = -_253;
    float _259 = _257 + 0.5;
    bool _263 = _253 > _255;
    float _265 = _127 * _125;
    float _267 = -_253;
    float _269 = _267 + (-0.5);
    float _271 = _265 * _259;
    float _273 = _127 * _227;
    int _276 = as_type<int>(_271);
    if (!_263)
    {
        float _278 = _273 * _269;
        _276 = as_type<int>(_278);
    }
    int _280 = _276;
    out.m_46.x = as_type<float>(_280);
    out.m_46.y = as_type<float>(_280);
    out.m_46.z = as_type<float>(_280);
    out.m_46.w = 1.0;
    return out;
}


struct main0_out_u
{
    uint4 m_46 [[color(0)]];
};

fragment main0_out_u main0_u(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _53 = in.m_27.x;
    float _55 = in.m_27.y;
    float2 _292 = float2(_53, _55);
    float _57 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_292, float2(0.0), isnan(_292))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_292, float2(0.0), isnan(_292))).x;
    float _59 = gl_FragCoord.w;
    float _61 = in.m_31.y;
    float _63 = gl_FragCoord.w;
    float _65 = _61 * _63;
    float _67 = in.m_31.x;
    float _69 = gl_FragCoord.w;
    float _71 = _67 * _69;
    float _73 = in.m_31.z;
    float _75 = gl_FragCoord.w;
    float _77 = _73 * _75;
    float _79 = in.m_31.w;
    float _81 = gl_FragCoord.w;
    float _83 = _79 * _81;
    float _85 = in.m_33.x;
    float _87 = gl_FragCoord.w;
    float _89 = _85 * _87;
    float _91 = in.m_35.y;
    float _93 = gl_FragCoord.w;
    float _95 = _91 * _93;
    float _97 = in.m_37.y;
    float _99 = gl_FragCoord.w;
    float _101 = _97 * _99;
    float _103 = in.m_33.z;
    float _105 = gl_FragCoord.w;
    float _107 = _103 * _105;
    float _109 = in.m_39.y;
    float _111 = gl_FragCoord.w;
    float _113 = _109 * _111;
    float _115 = in.m_41.y;
    float _117 = gl_FragCoord.w;
    float _119 = _115 * _117;
    float _121 = in.m_43.z;
    float _123 = gl_FragCoord.w;
    float _125 = _121 * _123;
    float _127 = 1.0 / _59;
    float _129 = _127 * _65;
    float _131 = _127 * _71;
    float _133 = _129 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
    float _135 = _129 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
    float _137 = _129 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
    float _139 = _127 * _77;
    float _141 = fma(_131, (*spvDescriptorSet0.fp_c3)._m0[6].x, _133);
    float _143 = fma(_131, (*spvDescriptorSet0.fp_c3)._m0[7].x, _135);
    float _145 = fma(_131, (*spvDescriptorSet0.fp_c3)._m0[8].x, _137);
    float _147 = _127 * _83;
    float _149 = fma(_139, (*spvDescriptorSet0.fp_c3)._m0[6].z, _141);
    float _151 = in.m_33.y;
    float _153 = gl_FragCoord.w;
    float _155 = _151 * _153;
    float _157 = fma(_139, (*spvDescriptorSet0.fp_c3)._m0[8].z, _145);
    float _159 = fma(_139, (*spvDescriptorSet0.fp_c3)._m0[7].z, _143);
    float _161 = fma(_147, (*spvDescriptorSet0.fp_c3)._m0[6].w, _149);
    float _163 = fma(_147, (*spvDescriptorSet0.fp_c3)._m0[8].w, _157);
    float _165 = fma(_147, (*spvDescriptorSet0.fp_c3)._m0[7].w, _159);
    float _167 = 1.0 / _163;
    float _169 = _127 * _155;
    float _171 = -_57;
    float _173 = fma(_171, (*spvDescriptorSet0.fp_c3)._m0[0].y, 1.0);
    float _175 = 1.0 / _173;
    float _177 = -(*spvDescriptorSet0.fp_c3)._m0[0].x;
    float _179 = _175 * _177;
    float _181 = _179 * _167;
    float _183 = _165 * _181;
    float _185 = _161 * _181;
    float _187 = _183 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _189 = _183 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _191 = _183 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
    float _193 = fma(_185, (*spvDescriptorSet0.fp_c3)._m0[3].x, _187);
    float _195 = in.m_43.x;
    float _197 = gl_FragCoord.w;
    float _199 = _195 * _197;
    float _201 = fma(_179, (*spvDescriptorSet0.fp_c3)._m0[3].z, _193);
    float _203 = fma(_185, (*spvDescriptorSet0.fp_c3)._m0[2].x, _189);
    float _205 = fma(_185, (*spvDescriptorSet0.fp_c3)._m0[4].x, _191);
    float _207 = _127 * _89;
    float _209 = _201 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _211 = fma(_179, (*spvDescriptorSet0.fp_c3)._m0[2].z, _203);
    float _213 = _127 * _95;
    float _215 = fma(_179, (*spvDescriptorSet0.fp_c3)._m0[4].z, _205);
    float _217 = -_169;
    float _219 = _209 + _217;
    float _221 = _211 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _223 = in.m_43.y;
    float _225 = gl_FragCoord.w;
    float _227 = _223 * _225;
    float _229 = _127 * _107;
    float _231 = _219 * _213;
    float _233 = -_207;
    float _235 = _221 + _233;
    float _237 = _127 * _101;
    float _239 = _215 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
    float _241 = fma(_235, _237, _231);
    float _243 = -_229;
    float _245 = _239 + _243;
    float _247 = _127 * _113;
    float _249 = fma(_245, _247, _241);
    float _251 = _127 * _119;
    float _253 = _251 + _249;
    float _255 = _127 * _199;
    float _257 = -_253;
    float _259 = _257 + 0.5;
    bool _263 = _253 > _255;
    float _265 = _127 * _125;
    float _267 = -_253;
    float _269 = _267 + (-0.5);
    float _271 = _265 * _259;
    float _273 = _127 * _227;
    int _276 = as_type<int>(_271);
    if (!_263)
    {
        float _278 = _273 * _269;
        _276 = as_type<int>(_278);
    }
    int _280 = _276;
    out.m_46.x = as_type<float>(_280);
    out.m_46.y = as_type<float>(_280);
    out.m_46.z = as_type<float>(_280);
    out.m_46.w = 1.0;
    return main0_out_u{as_type<uint4>(out.m_46)};
}

