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
    texture2d<float> fp_t_tcb_C [[id(7)]];
    sampler fp_t_tcb_CSmplr [[id(8)]];
    sampler fp_t_tcb_8Smplr_w [[id(9)]];
    sampler fp_t_tcb_ASmplr_w [[id(10)]];
    sampler fp_t_tcb_CSmplr_w [[id(11)]];
    constant dm_border_t* dm_border [[id(12)]];
};

struct main0_out
{
    float4 m_50 [[color(0)]];
};

struct main0_in
{
    float4 m_41 [[user(locn0)]];
    float4 m_45 [[user(locn1)]];
    float4 m_37 [[user(locn2)]];
    float4 m_54 [[user(locn3)]];
    float4 m_47 [[user(locn4)]];
    float4 m_43 [[user(locn5)]];
    float4 m_39 [[user(locn6)]];
    float4 m_52 [[user(locn8)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _61 = gl_FragCoord.w;
    float _63 = in.m_37.x;
    float _65 = gl_FragCoord.w;
    float _67 = _63 * _65;
    float _69 = in.m_37.z;
    float _71 = gl_FragCoord.w;
    float _73 = _69 * _71;
    float _75 = in.m_37.w;
    float _77 = gl_FragCoord.w;
    float _79 = _75 * _77;
    float _81 = in.m_37.y;
    float _83 = gl_FragCoord.w;
    float _85 = _81 * _83;
    float _87 = in.m_39.x;
    float _89 = gl_FragCoord.w;
    float _91 = _87 * _89;
    float _93 = in.m_39.y;
    float _95 = gl_FragCoord.w;
    float _97 = _93 * _95;
    float _99 = 1.0 / _61;
    float _101 = _99 * _67;
    float _103 = _99 * _73;
    float _105 = _99 * _79;
    float _107 = _99 * _85;
    float _109 = _99 * _91;
    float _111 = _99 * _97;
    float2 _418 = float2(_101, _107);
    float _113 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_418, float2(0.0), isnan(_418))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_418, float2(0.0), isnan(_418))).w;
    float2 _429 = float2(_103, _105);
    float _115 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_429, float2(0.0), isnan(_429))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_429, float2(0.0), isnan(_429))).w;
    float2 _437 = float2(_109, _111);
    float _117 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_437, float2(0.0), isnan(_437))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_437, float2(0.0), isnan(_437))).w;
    float _119 = in.m_41.w;
    float _121 = gl_FragCoord.w;
    float _123 = _119 * _121;
    float _125 = in.m_43.w;
    float _127 = gl_FragCoord.w;
    float _129 = _125 * _127;
    float _131 = in.m_45.w;
    float _133 = gl_FragCoord.w;
    float _135 = _131 * _133;
    float _137 = in.m_47.x;
    float _139 = gl_FragCoord.w;
    float _141 = _137 * _139;
    float _143 = _99 * _123;
    float _145 = _99 * _129;
    float _147 = _99 * _141;
    float _149 = in.m_43.z;
    float _151 = gl_FragCoord.w;
    float _153 = _149 * _151;
    float _155 = _113 * _115;
    float _157 = _155 * _117;
    float _159 = _99 * _135;
    float _161 = -_143;
    float _163 = fma(_157, _145, _161);
    float _165 = _159 * _163;
    float _167 = 0.0 + _165;
    float _169 = precise::clamp(_167, 0.0, 1.0);
    float _171 = _169 * _147;
    bool _175 = _171 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _177 = isnan(_171);
    bool _179 = _175 || _177;
    bool _181 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _183 = _179 || _181;
    float _185 = in.m_41.x;
    float _187 = gl_FragCoord.w;
    float _189 = _185 * _187;
    float _191 = in.m_43.x;
    float _193 = gl_FragCoord.w;
    float _195 = _191 * _193;
    if (!_183)
    {
        discard_fragment();
    }
    float _197 = _99 * _189;
    float _199 = _99 * _195;
    float _201 = in.m_43.y;
    float _203 = gl_FragCoord.w;
    float _205 = _201 * _203;
    float _207 = _197 * _199;
    float _209 = in.m_41.y;
    float _211 = gl_FragCoord.w;
    float _213 = _209 * _211;
    float _215 = _99 * _205;
    float _217 = in.m_41.z;
    float _219 = gl_FragCoord.w;
    float _221 = _217 * _219;
    float _223 = _99 * _213;
    float _225 = _223 * _215;
    float _227 = _99 * _221;
    float _229 = _99 * _153;
    float _231 = _227 * _229;
    if (!_183)
    {
        out.m_50.x = _207;
        out.m_50.y = _225;
        out.m_50.z = _231;
        out.m_50.w = _165;
        return out;
    }
    float _233 = _225 * 0.715200006961822509765625;
    float _235 = in.m_52.w;
    float _237 = gl_FragCoord.w;
    float _239 = _235 * _237;
    float _241 = in.m_52.z;
    float _243 = gl_FragCoord.w;
    float _245 = _241 * _243;
    float _247 = in.m_52.x;
    float _249 = gl_FragCoord.w;
    float _251 = _247 * _249;
    float _253 = fma(_207, 0.2125999927520751953125, _233);
    float _255 = in.m_52.y;
    float _257 = gl_FragCoord.w;
    float _259 = _255 * _257;
    float _261 = fma(_231, 0.072200000286102294921875, _253);
    bool _263 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _265 = 1.0 / _261;
    float _267 = _265 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _269 = precise::clamp(_267, 0.0, 1.0);
    float _271 = fma(_269, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _273 = _99 * _239;
    float _275 = 0.0 + _171;
    float _277 = precise::clamp(_275, 0.0, 1.0);
    float _279 = _99 * _245;
    float _281 = _99 * _259;
    float _283 = _271 * _273;
    float _285 = _99 * _251;
    float _287 = fma(_231, _283, _279);
    float _289 = fma(_207, _283, _285);
    float _291 = fma(_225, _283, _281);
    float _293 = _279;
    if (!_263)
    {
        _293 = _277;
    }
    float _295 = _293;
    bool _297 = !_263;
    float _299 = _295;
    if (!_297)
    {
        float _301 = in.m_54.w;
        float _303 = gl_FragCoord.w;
        float _305 = _301 * _303;
        float _307 = in.m_54.z;
        float _309 = gl_FragCoord.w;
        float _311 = _307 * _309;
        float _313 = _99 * _305;
        float _315 = _99 * _311;
        float _317 = 1.0 / _313;
        float _319 = _315 * _317;
        float _321 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _323 = fma(_319, (*spvDescriptorSet0.fp_c8)._m0[30].w, _321);
        float _325 = 1.0 / _323;
        float _327 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _329 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _331 = fma(_325, _327, _329);
        float _333 = _331 * 8.0;
        float _335 = precise::clamp(_333, 0.0, 1.0);
        float _337 = _277 * _335;
        _299 = _337;
    }
    float _339 = _299;
    float _341 = 0.0 + _339;
    float _343 = precise::clamp(_341, 0.0, 1.0);
    out.m_50.x = _289;
    out.m_50.y = _291;
    out.m_50.z = _287;
    out.m_50.w = _343;
    return out;
}

