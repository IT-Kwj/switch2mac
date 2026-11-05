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
    constant _16* fp_c10 [[id(1)]];
    constant _16* fp_c9 [[id(2)]];
    constant _16* fp_c15 [[id(3)]];
    texture2d<float> fp_t_tcb_10 [[id(4)]];
    sampler fp_t_tcb_10Smplr [[id(5)]];
    sampler fp_t_tcb_10Smplr_w [[id(6)]];
    constant dm_border_t* dm_border [[id(7)]];
};

struct main0_out
{
    float4 m_44 [[color(0)]];
};

struct main0_in
{
    float4 m_39 [[user(locn0)]];
    float4 m_37 [[user(locn1)]];
    float4 m_35 [[user(locn2)]];
    float4 m_41 [[user(locn3)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _51 = gl_FragCoord.w;
    float _53 = in.m_35.w;
    float _55 = gl_FragCoord.w;
    float _57 = _53 * _55;
    float _59 = in.m_35.x;
    float _61 = gl_FragCoord.w;
    float _63 = _59 * _61;
    float _65 = in.m_35.y;
    float _67 = gl_FragCoord.w;
    float _69 = _65 * _67;
    float _71 = 1.0 / _51;
    float _73 = _71 * _57;
    float _75 = _71 * _63;
    float _77 = _71 * _69;
    float _79 = 1.0 / _73;
    float _81 = _75 * _79;
    float _83 = _77 * _79;
    float2 _325 = float2(_81, _83);
    float _85 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_325, float2(0.0), isnan(_325))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_325, float2(0.0), isnan(_325))).x;
    float _87 = in.m_35.z;
    float _89 = gl_FragCoord.w;
    float _91 = _87 * _89;
    float _93 = in.m_37.w;
    float _95 = gl_FragCoord.w;
    float _97 = _93 * _95;
    float _99 = (*spvDescriptorSet0.fp_c8)._m0[28].y * (*spvDescriptorSet0.fp_c8)._m0[28].y;
    float _101 = fma((*spvDescriptorSet0.fp_c8)._m0[28].x, (*spvDescriptorSet0.fp_c8)._m0[28].x, _99);
    float _103 = fma((*spvDescriptorSet0.fp_c8)._m0[28].z, (*spvDescriptorSet0.fp_c8)._m0[28].z, _101);
    float _105 = in.m_39.w;
    float _107 = gl_FragCoord.w;
    float _109 = _105 * _107;
    float _111 = rsqrt(_103);
    float _113 = _111 * (*spvDescriptorSet0.fp_c8)._m0[28].y;
    float _115 = _111 * (*spvDescriptorSet0.fp_c8)._m0[28].x;
    float _117 = _113 * (*spvDescriptorSet0.fp_c10)._m0[9].y;
    float _119 = fma(_115, (*spvDescriptorSet0.fp_c10)._m0[8].y, _117);
    float _121 = _111 * (*spvDescriptorSet0.fp_c8)._m0[28].z;
    float _123 = _71 * _109;
    float _125 = fma(_121, (*spvDescriptorSet0.fp_c10)._m0[10].y, _119);
    float _127 = _71 * _91;
    float _129 = in.m_41.x;
    float _131 = gl_FragCoord.w;
    float _133 = _129 * _131;
    float _135 = _125 * _125;
    float _137 = _127 * _79;
    float _139 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[142].y;
    float _141 = _135 * _135;
    float _143 = _71 * _97;
    float _145 = _141 * _141;
    float _147 = _123 * _143;
    float _149 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _151 = fma(_137, (*spvDescriptorSet0.fp_c8)._m0[30].w, _149);
    float _153 = _145 * _145;
    float _155 = 1.0 / _151;
    float _157 = _153 * _147;
    float _159 = precise::clamp(_157, 0.0, 1.0);
    float _161 = in.m_39.z;
    float _163 = gl_FragCoord.w;
    float _165 = _161 * _163;
    float _167 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _169 = fma(_85, (*spvDescriptorSet0.fp_c8)._m0[30].w, _167);
    float _171 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _173 = _155 * _171;
    float _175 = 1.0 / _169;
    float _177 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _179 = -_173;
    float _181 = fma(_175, _177, _179);
    float _183 = _181 * _139;
    float _185 = precise::clamp(_183, 0.0, 1.0);
    float _187 = _71 * _133;
    float _189 = _159 * _185;
    float _191 = _189 * _187;
    bool _195 = _191 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _197 = isnan(_191);
    bool _199 = _195 || _197;
    bool _201 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _203 = _199 || _201;
    float _205 = in.m_39.x;
    float _207 = gl_FragCoord.w;
    float _209 = _205 * _207;
    float _211 = in.m_39.y;
    float _213 = gl_FragCoord.w;
    float _215 = _211 * _213;
    float _217 = (*spvDescriptorSet0.fp_c8)._m0[30].w;
    if (!_203)
    {
        discard_fragment();
    }
    float _219 = _71 * _209;
    float _221 = _71 * _215;
    float _223 = _71 * _165;
    if (!_203)
    {
        out.m_44.x = _219;
        out.m_44.y = _221;
        out.m_44.z = _223;
        out.m_44.w = _159;
        return out;
    }
    float _225 = _221 * 0.715200006961822509765625;
    float _227 = fma(_219, 0.2125999927520751953125, _225);
    float _229 = fma(_223, 0.072200000286102294921875, _227);
    bool _231 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _233 = 1.0 / _229;
    float _235 = 0.0 + _191;
    float _237 = precise::clamp(_235, 0.0, 1.0);
    float _239 = _237;
    if (_231)
    {
        float _241 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _243 = _173 + _241;
        _217 = _243;
    }
    float _245 = _217;
    float _247 = _233 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _249 = precise::clamp(_247, 0.0, 1.0);
    float _251 = _245;
    if (_231)
    {
        float _253 = _245 * 8.0;
        float _255 = precise::clamp(_253, 0.0, 1.0);
        _251 = _255;
    }
    float _257 = _251;
    float _259 = fma(_249, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    if (_231)
    {
        float _261 = _237 * _257;
        _239 = _261;
    }
    float _263 = _239;
    float _265 = _219 * _259;
    float _267 = _221 * _259;
    float _269 = _223 * _259;
    float _271 = 0.0 + _263;
    float _273 = precise::clamp(_271, 0.0, 1.0);
    out.m_44.x = _265;
    out.m_44.y = _267;
    out.m_44.z = _269;
    out.m_44.w = _273;
    return out;
}

