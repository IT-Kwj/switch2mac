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
    texture2d<float> fp_t_tcb_C [[id(5)]];
    sampler fp_t_tcb_CSmplr [[id(6)]];
    texture2d<float> fp_t_tcb_A [[id(7)]];
    sampler fp_t_tcb_ASmplr [[id(8)]];
    sampler fp_t_tcb_8Smplr_w [[id(9)]];
    sampler fp_t_tcb_CSmplr_w [[id(10)]];
    sampler fp_t_tcb_ASmplr_w [[id(11)]];
    constant dm_border_t* dm_border [[id(12)]];
};

struct main0_out
{
    float4 m_50 [[color(0)]];
};

struct main0_in
{
    float4 m_43 [[user(locn0)]];
    float4 m_45 [[user(locn1)]];
    float4 m_37 [[user(locn2)]];
    float4 m_54 [[user(locn3)]];
    float4 m_47 [[user(locn4)]];
    float4 m_39 [[user(locn5), flat]];
    float4 m_41 [[user(locn6)]];
    float4 m_52 [[user(locn8)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _61 = gl_FragCoord.w;
    float _63 = in.m_37.x;
    float _65 = gl_FragCoord.w;
    float _67 = _63 * _65;
    float _69 = in.m_37.y;
    float _71 = gl_FragCoord.w;
    float _73 = _69 * _71;
    float _75 = 1.0 / _61;
    float _77 = _75 * _67;
    float _79 = _75 * _73;
    float2 _358 = float2(_77, _79);
    float2 _83 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_358, float2(0.0), isnan(_358))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_358, float2(0.0), isnan(_358))).xy;
    float _85 = _83.x;
    float _87 = _83.y;
    float _89 = in.m_39.x;
    float _91 = in.m_37.z;
    float _93 = gl_FragCoord.w;
    float _95 = _91 * _93;
    float _97 = in.m_37.w;
    float _99 = gl_FragCoord.w;
    float _101 = _97 * _99;
    float _103 = in.m_41.y;
    float _105 = gl_FragCoord.w;
    float _107 = _103 * _105;
    float _109 = in.m_41.x;
    float _111 = gl_FragCoord.w;
    float _113 = _109 * _111;
    float _115 = _89 * (*spvDescriptorSet0.fp_c9)._m0[21].x;
    float _117 = _75 * _95;
    float _119 = _85 * _85;
    float _121 = _87 * _87;
    float _123 = _89 * (*spvDescriptorSet0.fp_c9)._m0[21].y;
    float _125 = _75 * _113;
    float _127 = fma(_119, 2.0, -1.0);
    float _129 = fma(_121, 2.0, -1.0);
    float _131 = _75 * _101;
    float _133 = fma(_115, _127, _117);
    float _135 = _75 * _107;
    float _137 = fma(_123, _129, _131);
    float2 _447 = float2(_125, _135);
    float _139 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_447, float2(0.0), isnan(_447))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_447, float2(0.0), isnan(_447))).w;
    float2 _455 = float2(_133, _137);
    float _141 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_455, float2(0.0), isnan(_455))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_455, float2(0.0), isnan(_455))).w;
    float _143 = in.m_43.w;
    float _145 = gl_FragCoord.w;
    float _147 = _143 * _145;
    float _149 = in.m_45.w;
    float _151 = gl_FragCoord.w;
    float _153 = _149 * _151;
    float _155 = in.m_47.x;
    float _157 = gl_FragCoord.w;
    float _159 = _155 * _157;
    float _161 = _75 * _147;
    float _163 = _75 * _153;
    float _165 = in.m_43.x;
    float _167 = gl_FragCoord.w;
    float _169 = _165 * _167;
    float _171 = -_161;
    float _173 = fma(_141, _139, _171);
    float _175 = _75 * _159;
    float _177 = _163 * _173;
    float _179 = 0.0 + _177;
    float _181 = precise::clamp(_179, 0.0, 1.0);
    float _183 = _181 * _175;
    bool _187 = _183 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _189 = isnan(_183);
    bool _191 = _187 || _189;
    bool _193 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _195 = _191 || _193;
    float _197 = in.m_43.y;
    float _199 = gl_FragCoord.w;
    float _201 = _197 * _199;
    float _203 = in.m_43.z;
    float _205 = gl_FragCoord.w;
    float _207 = _203 * _205;
    if (!_195)
    {
        discard_fragment();
    }
    float _209 = _75 * _169;
    float _211 = _75 * _201;
    float _213 = _75 * _207;
    if (!_195)
    {
        out.m_50.x = _209;
        out.m_50.y = _211;
        out.m_50.z = _213;
        out.m_50.w = _177;
        return out;
    }
    float _215 = _211 * 0.715200006961822509765625;
    float _217 = in.m_52.w;
    float _219 = gl_FragCoord.w;
    float _221 = _217 * _219;
    float _223 = in.m_52.z;
    float _225 = gl_FragCoord.w;
    float _227 = _223 * _225;
    float _229 = in.m_52.x;
    float _231 = gl_FragCoord.w;
    float _233 = _229 * _231;
    float _235 = fma(_209, 0.2125999927520751953125, _215);
    float _237 = in.m_52.y;
    float _239 = gl_FragCoord.w;
    float _241 = _237 * _239;
    float _243 = fma(_213, 0.072200000286102294921875, _235);
    bool _245 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _247 = 1.0 / _243;
    float _249 = _247 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _251 = precise::clamp(_249, 0.0, 1.0);
    float _253 = fma(_251, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _255 = _75 * _221;
    float _257 = 0.0 + _183;
    float _259 = precise::clamp(_257, 0.0, 1.0);
    float _261 = _75 * _227;
    float _263 = _75 * _241;
    float _265 = _253 * _255;
    float _267 = _75 * _233;
    float _269 = fma(_213, _265, _261);
    float _271 = fma(_209, _265, _267);
    float _273 = fma(_211, _265, _263);
    float _275 = _261;
    if (!_245)
    {
        _275 = _259;
    }
    float _277 = _275;
    bool _279 = !_245;
    float _281 = _277;
    if (!_279)
    {
        float _283 = in.m_54.w;
        float _285 = gl_FragCoord.w;
        float _287 = _283 * _285;
        float _289 = in.m_54.z;
        float _291 = gl_FragCoord.w;
        float _293 = _289 * _291;
        float _295 = _75 * _287;
        float _297 = _75 * _293;
        float _299 = 1.0 / _295;
        float _301 = _297 * _299;
        float _303 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _305 = fma(_301, (*spvDescriptorSet0.fp_c8)._m0[30].w, _303);
        float _307 = 1.0 / _305;
        float _309 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _311 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _313 = fma(_307, _309, _311);
        float _315 = _313 * 8.0;
        float _317 = precise::clamp(_315, 0.0, 1.0);
        float _319 = _259 * _317;
        _281 = _319;
    }
    float _321 = _281;
    float _323 = 0.0 + _321;
    float _325 = precise::clamp(_323, 0.0, 1.0);
    out.m_50.x = _271;
    out.m_50.y = _273;
    out.m_50.z = _269;
    out.m_50.w = _325;
    return out;
}

