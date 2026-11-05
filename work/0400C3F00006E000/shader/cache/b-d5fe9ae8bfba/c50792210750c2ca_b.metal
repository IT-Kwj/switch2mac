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
    texture2d<float> fp_t_tcb_10 [[id(3)]];
    sampler fp_t_tcb_10Smplr [[id(4)]];
    texture2d<float> fp_t_tcb_8 [[id(5)]];
    sampler fp_t_tcb_8Smplr [[id(6)]];
    sampler fp_t_tcb_10Smplr_w [[id(7)]];
    sampler fp_t_tcb_8Smplr_w [[id(8)]];
    constant dm_border_t* dm_border [[id(9)]];
};

struct main0_out
{
    float4 m_46 [[color(0)]];
};

struct main0_in
{
    float4 m_39 [[user(locn0)]];
    float4 m_37 [[user(locn1)]];
    float4 m_43 [[user(locn2)]];
    float4 m_35 [[user(locn3)]];
    float4 m_41 [[user(locn4)]];
    float4 m_48 [[user(locn6)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _55 = gl_FragCoord.w;
    float _57 = in.m_35.w;
    float _59 = gl_FragCoord.w;
    float _61 = _57 * _59;
    float _63 = in.m_35.x;
    float _65 = gl_FragCoord.w;
    float _67 = _63 * _65;
    float _69 = in.m_35.y;
    float _71 = gl_FragCoord.w;
    float _73 = _69 * _71;
    float _75 = 1.0 / _55;
    float _77 = _75 * _61;
    float _79 = _75 * _67;
    float _81 = _75 * _73;
    float _83 = 1.0 / _77;
    float _85 = _79 * _83;
    float _87 = _81 * _83;
    float2 _369 = float2(_85, _87);
    float _89 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_369, float2(0.0), isnan(_369))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_369, float2(0.0), isnan(_369))).x;
    float _91 = in.m_35.z;
    float _93 = gl_FragCoord.w;
    float _95 = _91 * _93;
    float _97 = in.m_37.w;
    float _99 = gl_FragCoord.w;
    float _101 = _97 * _99;
    float _103 = in.m_39.w;
    float _105 = gl_FragCoord.w;
    float _107 = _103 * _105;
    float _109 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[142].y;
    float _111 = _75 * _95;
    float _113 = _75 * _101;
    float _115 = in.m_41.x;
    float _117 = gl_FragCoord.w;
    float _119 = _115 * _117;
    float _121 = _111 * _83;
    float _123 = _75 * _107;
    float _125 = _113 * _113;
    float _127 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _129 = fma(_121, (*spvDescriptorSet0.fp_c8)._m0[30].w, _127);
    float _131 = _123 * _125;
    float _133 = 1.0 / _129;
    float _135 = 0.0 + _131;
    float _137 = precise::clamp(_135, 0.0, 1.0);
    float _139 = _75 * _119;
    float _141 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _143 = fma(_89, (*spvDescriptorSet0.fp_c8)._m0[30].w, _141);
    float _145 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _147 = _133 * _145;
    float _149 = 1.0 / _143;
    float _151 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _153 = -_147;
    float _155 = fma(_149, _151, _153);
    float _157 = _155 * _109;
    float _159 = precise::clamp(_157, 0.0, 1.0);
    float _161 = _137 * _159;
    float _163 = _161 * _139;
    bool _167 = _163 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _169 = isnan(_163);
    bool _171 = _167 || _169;
    bool _173 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _175 = _171 || _173;
    float _177 = in.m_43.x;
    float _179 = gl_FragCoord.w;
    float _181 = _177 * _179;
    float _183 = in.m_43.y;
    float _185 = gl_FragCoord.w;
    float _187 = _183 * _185;
    if (!_175)
    {
        discard_fragment();
    }
    float _189 = _75 * _181;
    float _191 = _75 * _187;
    float2 _527 = float2(_189, _191);
    float3 _195 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_527, float2(0.0), isnan(_527))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_527, float2(0.0), isnan(_527))).xyz;
    float _197 = _195.x;
    float _199 = _195.y;
    float _201 = _195.z;
    float _203 = in.m_39.x;
    float _205 = gl_FragCoord.w;
    float _207 = _203 * _205;
    float _209 = in.m_39.y;
    float _211 = gl_FragCoord.w;
    float _213 = _209 * _211;
    float _215 = in.m_39.z;
    float _217 = gl_FragCoord.w;
    float _219 = _215 * _217;
    float _221 = _75 * _207;
    float _223 = _75 * _213;
    float _225 = _75 * _219;
    float _227 = fma(_221, _125, _197);
    float _229 = fma(_223, _125, _199);
    float _231 = fma(_225, _125, _201);
    if (!_175)
    {
        out.m_46.x = _227;
        out.m_46.y = _229;
        out.m_46.z = _231;
        out.m_46.w = _131;
        return out;
    }
    float _233 = _229 * 0.715200006961822509765625;
    float _235 = in.m_48.w;
    float _237 = gl_FragCoord.w;
    float _239 = _235 * _237;
    float _241 = in.m_48.x;
    float _243 = gl_FragCoord.w;
    float _245 = _241 * _243;
    float _247 = in.m_48.y;
    float _249 = gl_FragCoord.w;
    float _251 = _247 * _249;
    float _253 = fma(_227, 0.2125999927520751953125, _233);
    float _255 = in.m_48.z;
    float _257 = gl_FragCoord.w;
    float _259 = _255 * _257;
    float _261 = fma(_231, 0.072200000286102294921875, _253);
    bool _263 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _265 = 1.0 / _261;
    float _267 = (*spvDescriptorSet0.fp_c15)._m0[653].w;
    if (_263)
    {
        float _269 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _271 = _147 + _269;
        _267 = _271;
    }
    float _273 = _267;
    float _275 = _265 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _277 = precise::clamp(_275, 0.0, 1.0);
    float _279 = fma(_277, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _281 = _75 * _239;
    float _283 = 0.0 + _163;
    float _285 = precise::clamp(_283, 0.0, 1.0);
    float _287 = _75 * _251;
    float _289 = _279 * _281;
    float _291 = _281;
    float _293 = _285;
    if (_263)
    {
        float _295 = _273 * 8.0;
        float _297 = precise::clamp(_295, 0.0, 1.0);
        _291 = _297;
    }
    float _299 = _291;
    float _301 = _75 * _245;
    float _303 = _75 * _259;
    if (_263)
    {
        float _305 = _285 * _299;
        _293 = _305;
    }
    float _307 = _293;
    float _309 = fma(_227, _289, _301);
    float _311 = fma(_229, _289, _287);
    float _313 = fma(_231, _289, _303);
    float _315 = 0.0 + _307;
    float _317 = precise::clamp(_315, 0.0, 1.0);
    out.m_46.x = _309;
    out.m_46.y = _311;
    out.m_46.z = _313;
    out.m_46.w = _317;
    return out;
}

