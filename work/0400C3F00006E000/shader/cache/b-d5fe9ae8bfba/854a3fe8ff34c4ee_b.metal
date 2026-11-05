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
    constant _16* fp_c9 [[id(1)]];
    constant _16* fp_c15 [[id(2)]];
    texture2d<float> fp_t_tcb_10 [[id(3)]];
    sampler fp_t_tcb_10Smplr [[id(4)]];
    texture2d<float> fp_t_tcb_8 [[id(5)]];
    sampler fp_t_tcb_8Smplr [[id(6)]];
    texture2d<float> fp_t_tcb_A [[id(7)]];
    sampler fp_t_tcb_ASmplr [[id(8)]];
    sampler fp_t_tcb_10Smplr_w [[id(9)]];
    sampler fp_t_tcb_8Smplr_w [[id(10)]];
    sampler fp_t_tcb_ASmplr_w [[id(11)]];
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
    float4 m_37 [[user(locn2)]];
    float4 m_45 [[user(locn3)]];
    float4 m_39 [[user(locn4)]];
    float4 m_50 [[user(locn6)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _57 = gl_FragCoord.w;
    float _59 = in.m_37.w;
    float _61 = gl_FragCoord.w;
    float _63 = _59 * _61;
    float _65 = in.m_37.x;
    float _67 = gl_FragCoord.w;
    float _69 = _65 * _67;
    float _71 = in.m_37.y;
    float _73 = gl_FragCoord.w;
    float _75 = _71 * _73;
    float _77 = in.m_39.y;
    float _79 = gl_FragCoord.w;
    float _81 = _77 * _79;
    float _83 = in.m_39.x;
    float _85 = gl_FragCoord.w;
    float _87 = _83 * _85;
    float _89 = in.m_39.w;
    float _91 = gl_FragCoord.w;
    float _93 = _89 * _91;
    float _95 = in.m_39.z;
    float _97 = gl_FragCoord.w;
    float _99 = _95 * _97;
    float _101 = 1.0 / _57;
    float _103 = _101 * _63;
    float _105 = _101 * _69;
    float _107 = _101 * _75;
    float _109 = _101 * _87;
    float _111 = 1.0 / _103;
    float _113 = _101 * _93;
    float _115 = _105 * _111;
    float _117 = _101 * _81;
    float _119 = _107 * _111;
    float _121 = _101 * _99;
    float2 _430 = float2(_115, _119);
    float _123 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_430, float2(0.0), isnan(_430))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_430, float2(0.0), isnan(_430))).x;
    float2 _441 = float2(_109, _117);
    float _125 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_441, float2(0.0), isnan(_441))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_441, float2(0.0), isnan(_441))).w;
    float2 _449 = float2(_121, _113);
    float _127 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_449, float2(0.0), isnan(_449))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_449, float2(0.0), isnan(_449))).w;
    float _129 = in.m_37.z;
    float _131 = gl_FragCoord.w;
    float _133 = _129 * _131;
    float _135 = in.m_41.w;
    float _137 = gl_FragCoord.w;
    float _139 = _135 * _137;
    float _141 = in.m_43.w;
    float _143 = gl_FragCoord.w;
    float _145 = _141 * _143;
    float _147 = in.m_45.x;
    float _149 = gl_FragCoord.w;
    float _151 = _147 * _149;
    float _153 = _101 * _133;
    float _155 = _153 * _111;
    float _157 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _159 = fma(_155, (*spvDescriptorSet0.fp_c8)._m0[30].w, _157);
    float _161 = 1.0 / _159;
    float _163 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _165 = _161 * _163;
    float _167 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _169 = fma(_123, (*spvDescriptorSet0.fp_c8)._m0[30].w, _167);
    float _171 = _125 * _125;
    float _173 = 1.0 / _169;
    float _175 = _171 * _127;
    float _177 = _101 * _139;
    float _179 = _177 + 0.699999988079071044921875;
    float _181 = precise::max(_177, _175);
    float _183 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[142].y;
    float _185 = precise::min(_179, _181);
    float _187 = _101 * _145;
    float _189 = _125 * _187;
    float _191 = precise::clamp(_189, 0.0, 1.0);
    float _193 = -_177;
    float _195 = _193 + _185;
    float _197 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _199 = -_165;
    float _201 = fma(_173, _197, _199);
    float _203 = fma(_195, 1.4285714626312255859375, _191);
    float _205 = precise::clamp(_203, 0.0, 1.0);
    float _207 = _201 * _183;
    float _209 = precise::clamp(_207, 0.0, 1.0);
    float _211 = _101 * _151;
    float _213 = _205 * _209;
    float _215 = _213 * _211;
    bool _219 = _215 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _221 = isnan(_215);
    bool _223 = _219 || _221;
    bool _225 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _227 = _223 || _225;
    float _229 = in.m_41.y;
    float _231 = gl_FragCoord.w;
    float _233 = _229 * _231;
    float _235 = in.m_41.x;
    float _237 = gl_FragCoord.w;
    float _239 = _235 * _237;
    float _241 = in.m_41.z;
    float _243 = gl_FragCoord.w;
    float _245 = _241 * _243;
    float _247 = _165;
    if (!_227)
    {
        discard_fragment();
    }
    float _249 = _101 * _233;
    float _251 = _101 * _239;
    float _253 = _101 * _245;
    if (!_227)
    {
        out.m_48.x = _251;
        out.m_48.y = _249;
        out.m_48.z = _253;
        out.m_48.w = _205;
        return out;
    }
    float _255 = _249 * 0.715200006961822509765625;
    float _257 = in.m_50.w;
    float _259 = gl_FragCoord.w;
    float _261 = _257 * _259;
    float _263 = in.m_50.x;
    float _265 = gl_FragCoord.w;
    float _267 = _263 * _265;
    float _269 = in.m_50.y;
    float _271 = gl_FragCoord.w;
    float _273 = _269 * _271;
    float _275 = fma(_251, 0.2125999927520751953125, _255);
    float _277 = in.m_50.z;
    float _279 = gl_FragCoord.w;
    float _281 = _277 * _279;
    float _283 = fma(_253, 0.072200000286102294921875, _275);
    bool _285 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _287 = 1.0 / _283;
    float _289 = (*spvDescriptorSet0.fp_c15)._m0[2].y;
    if (_285)
    {
        float _291 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _293 = _165 + _291;
        _247 = _293;
    }
    float _295 = _247;
    float _297 = _287 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _299 = precise::clamp(_297, 0.0, 1.0);
    float _301 = fma(_299, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _303 = _101 * _261;
    if (_285)
    {
        float _305 = _295 * 8.0;
        float _307 = precise::clamp(_305, 0.0, 1.0);
        _289 = _307;
    }
    float _309 = _289;
    float _311 = _101 * _273;
    float _313 = _301 * _303;
    float _315 = 0.0 + _215;
    float _317 = precise::clamp(_315, 0.0, 1.0);
    float _319 = _101 * _267;
    float _321 = _101 * _281;
    float _323 = fma(_249, _313, _311);
    float _325 = _317;
    if (_285)
    {
        float _327 = _317 * _309;
        _325 = _327;
    }
    float _329 = _325;
    float _331 = fma(_251, _313, _319);
    float _333 = fma(_253, _313, _321);
    float _335 = 0.0 + _329;
    float _337 = precise::clamp(_335, 0.0, 1.0);
    out.m_48.x = _331;
    out.m_48.y = _323;
    out.m_48.z = _333;
    out.m_48.w = _337;
    return out;
}

