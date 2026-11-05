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
    constant _16* fp_c15 [[id(1)]];
    constant _16* fp_c8 [[id(2)]];
    texture2d<float> fp_t_tcb_8 [[id(3)]];
    sampler fp_t_tcb_8Smplr [[id(4)]];
    texture2d<float> fp_t_tcb_A [[id(5)]];
    sampler fp_t_tcb_ASmplr [[id(6)]];
    sampler fp_t_tcb_8Smplr_w [[id(7)]];
    sampler fp_t_tcb_ASmplr_w [[id(8)]];
    constant dm_border_t* dm_border [[id(9)]];
};

struct main0_out
{
    float4 m_46 [[color(0)]];
};

struct main0_in
{
    float4 m_37 [[user(locn0)]];
    float4 m_41 [[user(locn1)]];
    float4 m_35 [[user(locn2)]];
    float4 m_50 [[user(locn3)]];
    float4 m_43 [[user(locn4)]];
    float4 m_39 [[user(locn5)]];
    float4 m_48 [[user(locn7)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _57 = gl_FragCoord.w;
    float _59 = in.m_35.x;
    float _61 = gl_FragCoord.w;
    float _63 = _59 * _61;
    float _65 = in.m_35.z;
    float _67 = gl_FragCoord.w;
    float _69 = _65 * _67;
    float _71 = in.m_35.y;
    float _73 = gl_FragCoord.w;
    float _75 = _71 * _73;
    float _77 = in.m_35.w;
    float _79 = gl_FragCoord.w;
    float _81 = _77 * _79;
    float _83 = 1.0 / _57;
    float _85 = _83 * _63;
    float _87 = _83 * _69;
    float _89 = _83 * _75;
    float _91 = _83 * _81;
    float2 _374 = float2(_85, _89);
    float _93 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_374, float2(0.0), isnan(_374))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_374, float2(0.0), isnan(_374))).w;
    float2 _385 = float2(_87, _91);
    float _95 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_385, float2(0.0), isnan(_385))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_385, float2(0.0), isnan(_385))).w;
    float _97 = in.m_37.w;
    float _99 = gl_FragCoord.w;
    float _101 = _97 * _99;
    float _103 = in.m_39.w;
    float _105 = gl_FragCoord.w;
    float _107 = _103 * _105;
    float _109 = in.m_41.w;
    float _111 = gl_FragCoord.w;
    float _113 = _109 * _111;
    float _115 = in.m_43.x;
    float _117 = gl_FragCoord.w;
    float _119 = _115 * _117;
    float _121 = _83 * _101;
    float _123 = _83 * _107;
    float _125 = _83 * _113;
    float _127 = _83 * _119;
    float _129 = _93 * _95;
    float _131 = -_121;
    float _133 = fma(_129, _123, _131);
    float _135 = _125 * _133;
    float _137 = 0.0 + _135;
    float _139 = precise::clamp(_137, 0.0, 1.0);
    float _141 = _139 * _127;
    bool _145 = _141 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _147 = isnan(_141);
    bool _149 = _145 || _147;
    bool _151 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _153 = _149 || _151;
    float _155 = in.m_37.x;
    float _157 = gl_FragCoord.w;
    float _159 = _155 * _157;
    float _161 = in.m_39.x;
    float _163 = gl_FragCoord.w;
    float _165 = _161 * _163;
    if (!_153)
    {
        discard_fragment();
    }
    float _167 = in.m_39.z;
    float _169 = gl_FragCoord.w;
    float _171 = _167 * _169;
    float _173 = _83 * _159;
    float _175 = _83 * _165;
    float _177 = in.m_39.y;
    float _179 = gl_FragCoord.w;
    float _181 = _177 * _179;
    float _183 = _173 * _175;
    float _185 = in.m_37.y;
    float _187 = gl_FragCoord.w;
    float _189 = _185 * _187;
    float _191 = _83 * _181;
    float _193 = in.m_37.z;
    float _195 = gl_FragCoord.w;
    float _197 = _193 * _195;
    float _199 = _83 * _189;
    float _201 = _199 * _191;
    float _203 = _83 * _197;
    float _205 = _83 * _171;
    float _207 = _203 * _205;
    if (!_153)
    {
        out.m_46.x = _183;
        out.m_46.y = _201;
        out.m_46.z = _207;
        out.m_46.w = _135;
        return out;
    }
    float _209 = _201 * 0.715200006961822509765625;
    float _211 = in.m_48.w;
    float _213 = gl_FragCoord.w;
    float _215 = _211 * _213;
    float _217 = in.m_48.z;
    float _219 = gl_FragCoord.w;
    float _221 = _217 * _219;
    float _223 = in.m_48.x;
    float _225 = gl_FragCoord.w;
    float _227 = _223 * _225;
    float _229 = fma(_183, 0.2125999927520751953125, _209);
    float _231 = in.m_48.y;
    float _233 = gl_FragCoord.w;
    float _235 = _231 * _233;
    float _237 = fma(_207, 0.072200000286102294921875, _229);
    bool _239 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _241 = 1.0 / _237;
    float _243 = _241 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _245 = precise::clamp(_243, 0.0, 1.0);
    float _247 = fma(_245, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _249 = _83 * _215;
    float _251 = 0.0 + _141;
    float _253 = precise::clamp(_251, 0.0, 1.0);
    float _255 = _83 * _221;
    float _257 = _83 * _235;
    float _259 = _247 * _249;
    float _261 = _83 * _227;
    float _263 = fma(_207, _259, _255);
    float _265 = fma(_183, _259, _261);
    float _267 = fma(_201, _259, _257);
    float _269 = _255;
    if (!_239)
    {
        _269 = _253;
    }
    float _271 = _269;
    bool _273 = !_239;
    float _275 = _271;
    if (!_273)
    {
        float _277 = in.m_50.w;
        float _279 = gl_FragCoord.w;
        float _281 = _277 * _279;
        float _283 = in.m_50.z;
        float _285 = gl_FragCoord.w;
        float _287 = _283 * _285;
        float _289 = _83 * _281;
        float _291 = _83 * _287;
        float _293 = 1.0 / _289;
        float _295 = _291 * _293;
        float _297 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _299 = fma(_295, (*spvDescriptorSet0.fp_c8)._m0[30].w, _297);
        float _301 = 1.0 / _299;
        float _303 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _305 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _307 = fma(_301, _303, _305);
        float _309 = _307 * 8.0;
        float _311 = precise::clamp(_309, 0.0, 1.0);
        float _313 = _253 * _311;
        _275 = _313;
    }
    float _315 = _275;
    float _317 = 0.0 + _315;
    float _319 = precise::clamp(_317, 0.0, 1.0);
    out.m_46.x = _265;
    out.m_46.y = _267;
    out.m_46.z = _263;
    out.m_46.w = _319;
    return out;
}

