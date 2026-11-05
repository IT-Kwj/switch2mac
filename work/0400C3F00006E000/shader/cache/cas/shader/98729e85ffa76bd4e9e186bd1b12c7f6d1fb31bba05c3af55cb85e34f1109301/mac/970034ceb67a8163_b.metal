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
    texture2d<float> fp_t_tcb_E [[id(3)]];
    sampler fp_t_tcb_ESmplr [[id(4)]];
    sampler fp_t_tcb_ESmplr_w [[id(5)]];
    constant dm_border_t* dm_border [[id(6)]];
};

struct main0_out
{
    float4 m_44 [[color(0)]];
};

struct main0_in
{
    float4 m_39 [[user(locn0)]];
    float4 m_41 [[user(locn1)]];
    float4 m_37 [[user(locn2)]];
    float4 m_33 [[user(locn3)]];
    float4 m_35 [[user(locn4)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _51 = gl_FragCoord.w;
    float _53 = in.m_33.y;
    float _55 = gl_FragCoord.w;
    float _57 = _53 * _55;
    float _59 = in.m_33.x;
    float _61 = gl_FragCoord.w;
    float _63 = _59 * _61;
    float _65 = in.m_33.z;
    float _67 = gl_FragCoord.w;
    float _69 = _65 * _67;
    float _71 = in.m_35.y;
    float _73 = gl_FragCoord.w;
    float _75 = _71 * _73;
    float _77 = in.m_35.x;
    float _79 = gl_FragCoord.w;
    float _81 = _77 * _79;
    float _83 = in.m_35.z;
    float _85 = gl_FragCoord.w;
    float _87 = _83 * _85;
    float _89 = in.m_37.x;
    float _91 = gl_FragCoord.w;
    float _93 = _89 * _91;
    float _95 = 1.0 / _51;
    float _97 = _95 * _57;
    float _99 = _95 * _63;
    float _101 = _95 * _69;
    float _103 = _95 * _75;
    float _105 = _97 * _97;
    float _107 = _95 * _81;
    float _109 = -(*spvDescriptorSet0.fp_c8)._m0[29].y;
    float _111 = _103 + _109;
    float _113 = fma(_99, _99, _105);
    float _115 = _95 * _87;
    float _117 = -(*spvDescriptorSet0.fp_c8)._m0[29].x;
    float _119 = _107 + _117;
    float _121 = _111 * _111;
    float _123 = fma(_101, _101, _113);
    float _125 = -(*spvDescriptorSet0.fp_c8)._m0[29].z;
    float _127 = _115 + _125;
    float _129 = in.m_39.w;
    float _131 = gl_FragCoord.w;
    float _133 = _129 * _131;
    float _135 = fma(_119, _119, _121);
    float _137 = rsqrt(_123);
    float _139 = fma(_127, _127, _135);
    float _141 = rsqrt(_139);
    float _143 = _97 * _137;
    float _145 = _99 * _137;
    float _147 = _101 * _137;
    float _149 = _143 * _143;
    float _151 = fma(_145, _145, _149);
    float _153 = _111 * _141;
    float _155 = _119 * _141;
    float _157 = _127 * _141;
    float _159 = fma(_147, _147, _151);
    float _161 = rsqrt(_159);
    float _163 = _143 * _161;
    float _165 = _145 * _161;
    float _167 = _147 * _161;
    float _169 = _163 * _153;
    float _171 = fma(_165, _155, _169);
    float _173 = _95 * _93;
    float _175 = fma(_167, _157, _171);
    float _177 = _95 * _133;
    float _179 = abs(_175);
    float _181 = -_179;
    float _183 = _181 + 1.0;
    float _185 = _183 * _177;
    float _187 = precise::clamp(_185, 0.0, 1.0);
    float _189 = _187 * _173;
    bool _193 = _189 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _195 = isnan(_189);
    bool _197 = _193 || _195;
    bool _199 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _201 = _197 || _199;
    float _203 = abs(_183);
    float _205 = log2(_203);
    float _207 = in.m_41.w;
    float _209 = gl_FragCoord.w;
    float _211 = _207 * _209;
    if (!_201)
    {
        discard_fragment();
    }
    float _213 = _205 * (*spvDescriptorSet0.fp_c9)._m0[194].x;
    float _215 = in.m_41.x;
    float _217 = gl_FragCoord.w;
    float _219 = _215 * _217;
    float _221 = in.m_41.y;
    float _223 = gl_FragCoord.w;
    float _225 = _221 * _223;
    float _227 = _163 * (*spvDescriptorSet0.fp_c8)._m0[0].y;
    float _229 = _163 * (*spvDescriptorSet0.fp_c8)._m0[1].y;
    float _231 = exp2(_213);
    float _233 = _95 * _211;
    float _235 = fma(_165, (*spvDescriptorSet0.fp_c8)._m0[0].x, _227);
    float _237 = fma(_165, (*spvDescriptorSet0.fp_c8)._m0[1].x, _229);
    float _239 = 1.0 / _233;
    float _241 = fma(_167, (*spvDescriptorSet0.fp_c8)._m0[0].z, _235);
    float _243 = _231 * (*spvDescriptorSet0.fp_c9)._m0[194].y;
    float _245 = fma(_167, (*spvDescriptorSet0.fp_c8)._m0[1].z, _237);
    float _247 = _243 * (*spvDescriptorSet0.fp_c9)._m0[194].z;
    float _249 = _243 * (*spvDescriptorSet0.fp_c9)._m0[194].w;
    float _251 = _241 * _247;
    float _253 = _245 * _249;
    float _255 = _95 * _219;
    float _257 = _95 * _225;
    float _259 = _251 * (*spvDescriptorSet0.fp_c15)._m0[630].w;
    float _261 = -_253;
    float _263 = fma(_257, _239, _261);
    float _265 = fma(_255, _239, _259);
    float2 _651 = float2(_265, _263);
    float3 _269 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_651, float2(0.0), isnan(_651))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_651, float2(0.0), isnan(_651))).xyz;
    float _271 = _269.x;
    float _273 = _269.y;
    float _275 = _269.z;
    float _277 = in.m_41.z;
    float _279 = gl_FragCoord.w;
    float _281 = _277 * _279;
    float _283 = _95 * _281;
    if (!_201)
    {
        out.m_44.x = _271;
        out.m_44.y = _273;
        out.m_44.z = _275;
        out.m_44.w = _187;
        return out;
    }
    bool _285 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _287 = 0.0 + _189;
    float _289 = precise::clamp(_287, 0.0, 1.0);
    bool _291 = !_285;
    float _293 = _289;
    if (!_291)
    {
        float _295 = _283 * _239;
        float _297 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _299 = fma(_295, (*spvDescriptorSet0.fp_c8)._m0[30].w, _297);
        float _301 = 1.0 / _299;
        float _303 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _305 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _307 = fma(_301, _303, _305);
        float _309 = _307 * 8.0;
        float _311 = precise::clamp(_309, 0.0, 1.0);
        float _313 = _289 * _311;
        _293 = _313;
    }
    float _315 = _293;
    float _317 = 0.0 + _315;
    float _319 = precise::clamp(_317, 0.0, 1.0);
    out.m_44.x = _271;
    out.m_44.y = _273;
    out.m_44.z = _275;
    out.m_44.w = _319;
    return out;
}

