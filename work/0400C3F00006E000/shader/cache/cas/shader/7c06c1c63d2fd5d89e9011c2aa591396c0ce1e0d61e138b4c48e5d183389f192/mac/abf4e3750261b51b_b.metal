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
    texture2d<float> fp_t_tcb_A [[id(3)]];
    sampler fp_t_tcb_ASmplr [[id(4)]];
    texture2d<float> fp_t_tcb_C [[id(5)]];
    sampler fp_t_tcb_CSmplr [[id(6)]];
    texture2d<float> fp_t_tcb_8 [[id(7)]];
    sampler fp_t_tcb_8Smplr [[id(8)]];
    sampler fp_t_tcb_ASmplr_w [[id(9)]];
    sampler fp_t_tcb_CSmplr_w [[id(10)]];
    sampler fp_t_tcb_8Smplr_w [[id(11)]];
    constant dm_border_t* dm_border [[id(12)]];
};

struct main0_out
{
    float4 m_48 [[color(0)]];
};

struct main0_in
{
    float4 m_41 [[user(locn0)]];
    float4 m_43 [[user(locn1)]];
    float4 m_52 [[user(locn2)]];
    float4 m_45 [[user(locn3)]];
    float4 m_37 [[user(locn4)]];
    float4 m_39 [[user(locn5)]];
    float4 m_50 [[user(locn7)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _59 = gl_FragCoord.w;
    float _61 = in.m_37.z;
    float _63 = gl_FragCoord.w;
    float _65 = _61 * _63;
    float _67 = in.m_39.x;
    float _69 = gl_FragCoord.w;
    float _71 = _67 * _69;
    float _73 = in.m_39.y;
    float _75 = gl_FragCoord.w;
    float _77 = _73 * _75;
    float _79 = in.m_37.w;
    float _81 = gl_FragCoord.w;
    float _83 = _79 * _81;
    float _85 = 1.0 / _59;
    float _87 = _85 * _65;
    float _89 = _85 * _71;
    float _91 = _85 * _77;
    float _93 = _85 * _83;
    float2 _414 = float2(_87, _93);
    float _95 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_414, float2(0.0), isnan(_414))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_414, float2(0.0), isnan(_414))).w;
    float2 _425 = float2(_89, _91);
    float _97 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_425, float2(0.0), isnan(_425))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_425, float2(0.0), isnan(_425))).w;
    float _99 = in.m_41.w;
    float _101 = gl_FragCoord.w;
    float _103 = _99 * _101;
    float _105 = in.m_43.w;
    float _107 = gl_FragCoord.w;
    float _109 = _105 * _107;
    float _111 = in.m_45.x;
    float _113 = gl_FragCoord.w;
    float _115 = _111 * _113;
    float _117 = _85 * _103;
    float _119 = _85 * _109;
    float _121 = in.m_37.x;
    float _123 = gl_FragCoord.w;
    float _125 = _121 * _123;
    float _127 = -_95;
    float _129 = _127 + _97;
    float _131 = -_117;
    float _133 = _129 + _131;
    float _135 = _85 * _115;
    float _137 = _119 * _133;
    float _139 = 0.0 + _137;
    float _141 = precise::clamp(_139, 0.0, 1.0);
    float _143 = _141 * _135;
    bool _147 = _143 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _149 = isnan(_143);
    bool _151 = _147 || _149;
    bool _153 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _155 = _151 || _153;
    float _157 = in.m_37.y;
    float _159 = gl_FragCoord.w;
    float _161 = _157 * _159;
    if (!_155)
    {
        discard_fragment();
    }
    float _163 = _85 * _125;
    float _165 = _85 * _161;
    float2 _525 = float2(_163, _165);
    float3 _169 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_525, float2(0.0), isnan(_525))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_525, float2(0.0), isnan(_525))).xyz;
    float _171 = _169.x;
    float _173 = _169.y;
    float _175 = _169.z;
    float _177 = in.m_41.z;
    float _179 = gl_FragCoord.w;
    float _181 = _177 * _179;
    float _183 = in.m_41.x;
    float _185 = gl_FragCoord.w;
    float _187 = _183 * _185;
    float _189 = in.m_43.x;
    float _191 = gl_FragCoord.w;
    float _193 = _189 * _191;
    float _195 = in.m_41.y;
    float _197 = gl_FragCoord.w;
    float _199 = _195 * _197;
    float _201 = in.m_43.y;
    float _203 = gl_FragCoord.w;
    float _205 = _201 * _203;
    float _207 = in.m_43.z;
    float _209 = gl_FragCoord.w;
    float _211 = _207 * _209;
    float _213 = _85 * _181;
    float _215 = _85 * _187;
    float _217 = _85 * _193;
    float _219 = _85 * _199;
    float _221 = _85 * _205;
    float _223 = _85 * _211;
    float _225 = -_217;
    float _227 = _215 + _225;
    float _229 = -_221;
    float _231 = _219 + _229;
    float _233 = -_223;
    float _235 = _213 + _233;
    float _237 = _171 * _171;
    float _239 = _173 * _173;
    float _241 = _175 * _175;
    float _243 = fma(_237, _227, _217);
    float _245 = fma(_239, _231, _221);
    float _247 = fma(_241, _235, _223);
    if (!_155)
    {
        out.m_48.x = _243;
        out.m_48.y = _245;
        out.m_48.z = _247;
        out.m_48.w = _137;
        return out;
    }
    float _249 = _245 * 0.715200006961822509765625;
    float _251 = in.m_50.w;
    float _253 = gl_FragCoord.w;
    float _255 = _251 * _253;
    float _257 = in.m_50.z;
    float _259 = gl_FragCoord.w;
    float _261 = _257 * _259;
    float _263 = in.m_50.x;
    float _265 = gl_FragCoord.w;
    float _267 = _263 * _265;
    float _269 = fma(_243, 0.2125999927520751953125, _249);
    float _271 = in.m_50.y;
    float _273 = gl_FragCoord.w;
    float _275 = _271 * _273;
    float _277 = fma(_247, 0.072200000286102294921875, _269);
    bool _279 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _281 = 1.0 / _277;
    float _283 = _281 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _285 = precise::clamp(_283, 0.0, 1.0);
    float _287 = fma(_285, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _289 = _85 * _255;
    float _291 = 0.0 + _143;
    float _293 = precise::clamp(_291, 0.0, 1.0);
    float _295 = _85 * _261;
    float _297 = _85 * _275;
    float _299 = _287 * _289;
    float _301 = _85 * _267;
    float _303 = fma(_247, _299, _295);
    float _305 = fma(_243, _299, _301);
    float _307 = fma(_245, _299, _297);
    float _309 = _295;
    if (!_279)
    {
        _309 = _293;
    }
    float _311 = _309;
    bool _313 = !_279;
    float _315 = _311;
    if (!_313)
    {
        float _317 = in.m_52.w;
        float _319 = gl_FragCoord.w;
        float _321 = _317 * _319;
        float _323 = in.m_52.z;
        float _325 = gl_FragCoord.w;
        float _327 = _323 * _325;
        float _329 = _85 * _321;
        float _331 = _85 * _327;
        float _333 = 1.0 / _329;
        float _335 = _331 * _333;
        float _337 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _339 = fma(_335, (*spvDescriptorSet0.fp_c8)._m0[30].w, _337);
        float _341 = 1.0 / _339;
        float _343 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _345 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _347 = fma(_341, _343, _345);
        float _349 = _347 * 8.0;
        float _351 = precise::clamp(_349, 0.0, 1.0);
        float _353 = _293 * _351;
        _315 = _353;
    }
    float _355 = _315;
    float _357 = 0.0 + _355;
    float _359 = precise::clamp(_357, 0.0, 1.0);
    out.m_48.x = _305;
    out.m_48.y = _307;
    out.m_48.z = _303;
    out.m_48.w = _359;
    return out;
}

