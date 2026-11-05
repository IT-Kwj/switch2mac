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
    texture2d<float> fp_t_tcb_8 [[id(3)]];
    sampler fp_t_tcb_8Smplr [[id(4)]];
    texture2d<float> fp_t_tcb_10 [[id(5)]];
    sampler fp_t_tcb_10Smplr [[id(6)]];
    texture2d<float> fp_t_tcb_A [[id(7)]];
    sampler fp_t_tcb_ASmplr [[id(8)]];
    sampler fp_t_tcb_8Smplr_w [[id(9)]];
    sampler fp_t_tcb_10Smplr_w [[id(10)]];
    sampler fp_t_tcb_ASmplr_w [[id(11)]];
    constant dm_border_t* dm_border [[id(12)]];
};

struct main0_out
{
    float4 m_50 [[color(0)]];
};

struct main0_in
{
    float4 m_45 [[user(locn0)]];
    float4 m_47 [[user(locn2)]];
    float4 m_43 [[user(locn3)]];
    float4 m_41 [[user(locn4), flat]];
    float4 m_37 [[user(locn5)]];
    float4 m_39 [[user(locn6)]];
    float4 m_52 [[user(locn8)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _59 = gl_FragCoord.w;
    float _61 = in.m_37.y;
    float _63 = gl_FragCoord.w;
    float _65 = _61 * _63;
    float _67 = in.m_37.x;
    float _69 = gl_FragCoord.w;
    float _71 = _67 * _69;
    float _73 = 1.0 / _59;
    float _75 = _73 * _65;
    float _77 = _73 * _71;
    float2 _408 = float2(_77, _75);
    float2 _81 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_408, float2(0.0), isnan(_408))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_408, float2(0.0), isnan(_408))).xy;
    float _83 = _81.x;
    float _85 = _81.y;
    float _87 = in.m_39.w;
    float _89 = gl_FragCoord.w;
    float _91 = _87 * _89;
    float _93 = in.m_39.x;
    float _95 = gl_FragCoord.w;
    float _97 = _93 * _95;
    float _99 = in.m_39.y;
    float _101 = gl_FragCoord.w;
    float _103 = _99 * _101;
    float _105 = in.m_37.z;
    float _107 = gl_FragCoord.w;
    float _109 = _105 * _107;
    float _111 = in.m_41.x;
    float _113 = in.m_37.w;
    float _115 = gl_FragCoord.w;
    float _117 = _113 * _115;
    float _119 = _73 * _91;
    float _121 = _73 * _97;
    float _123 = _73 * _103;
    float _125 = 1.0 / _119;
    float _127 = _111 * (*spvDescriptorSet0.fp_c9)._m0[21].x;
    float _129 = _111 * (*spvDescriptorSet0.fp_c9)._m0[21].y;
    float _131 = _121 * _125;
    float _133 = _123 * _125;
    float _135 = fma(_83, -2.0, 1.0);
    float _137 = _73 * _109;
    float _139 = fma(_85, -2.0, 1.0);
    float _141 = _73 * _117;
    float _143 = fma(_127, _135, _137);
    float2 _504 = float2(_131, _133);
    float _145 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_504, float2(0.0), isnan(_504))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_504, float2(0.0), isnan(_504))).x;
    float _147 = fma(_129, _139, _141);
    float2 _516 = float2(_143, _147);
    float _149 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_516, float2(0.0), isnan(_516))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_516, float2(0.0), isnan(_516))).w;
    float _151 = in.m_39.z;
    float _153 = gl_FragCoord.w;
    float _155 = _151 * _153;
    float _157 = in.m_43.w;
    float _159 = gl_FragCoord.w;
    float _161 = _157 * _159;
    float _163 = in.m_45.w;
    float _165 = gl_FragCoord.w;
    float _167 = _163 * _165;
    float _169 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[142].y;
    float _171 = _73 * _155;
    float _173 = in.m_47.x;
    float _175 = gl_FragCoord.w;
    float _177 = _173 * _175;
    float _179 = _171 * _125;
    float _181 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _183 = fma(_179, (*spvDescriptorSet0.fp_c8)._m0[30].w, _181);
    float _185 = 1.0 / _183;
    float _187 = _73 * _161;
    float _189 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _191 = _185 * _189;
    float _193 = _73 * _177;
    float _195 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _197 = fma(_145, (*spvDescriptorSet0.fp_c8)._m0[30].w, _195);
    float _199 = 1.0 / _197;
    float _201 = _149 * _187;
    float _203 = _73 * _167;
    float _205 = _203 * _201;
    float _207 = 0.0 + _205;
    float _209 = precise::clamp(_207, 0.0, 1.0);
    float _211 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _213 = -_191;
    float _215 = fma(_199, _211, _213);
    float _217 = _215 * _169;
    float _219 = precise::clamp(_217, 0.0, 1.0);
    float _221 = _209 * _219;
    float _223 = _221 * _193;
    bool _227 = _223 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _229 = isnan(_223);
    bool _231 = _227 || _229;
    bool _233 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _235 = _231 || _233;
    float _237 = in.m_43.x;
    float _239 = gl_FragCoord.w;
    float _241 = _237 * _239;
    float _243 = _191;
    float _245 = _223;
    if (!_235)
    {
        discard_fragment();
    }
    float _247 = in.m_45.x;
    float _249 = gl_FragCoord.w;
    float _251 = _247 * _249;
    float _253 = in.m_43.y;
    float _255 = gl_FragCoord.w;
    float _257 = _253 * _255;
    float _259 = _73 * _241;
    float _261 = in.m_45.y;
    float _263 = gl_FragCoord.w;
    float _265 = _261 * _263;
    float _267 = _73 * _251;
    float _269 = _267 * _259;
    float _271 = _73 * _265;
    float _273 = _73 * _257;
    float _275 = in.m_43.z;
    float _277 = gl_FragCoord.w;
    float _279 = _275 * _277;
    float _281 = _271 * _273;
    float _283 = in.m_45.z;
    float _285 = gl_FragCoord.w;
    float _287 = _283 * _285;
    float _289 = _73 * _279;
    float _291 = _73 * _287;
    float _293 = _291 * _289;
    if (!_235)
    {
        out.m_50.x = _269;
        out.m_50.y = _281;
        out.m_50.z = _293;
        out.m_50.w = _205;
        return out;
    }
    float _295 = _281 * 0.715200006961822509765625;
    float _297 = in.m_52.w;
    float _299 = gl_FragCoord.w;
    float _301 = _297 * _299;
    float _303 = in.m_52.x;
    float _305 = gl_FragCoord.w;
    float _307 = _303 * _305;
    float _309 = in.m_52.y;
    float _311 = gl_FragCoord.w;
    float _313 = _309 * _311;
    float _315 = fma(_269, 0.2125999927520751953125, _295);
    float _317 = in.m_52.z;
    float _319 = gl_FragCoord.w;
    float _321 = _317 * _319;
    float _323 = fma(_293, 0.072200000286102294921875, _315);
    bool _325 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _327 = 1.0 / _323;
    if (_325)
    {
        float _329 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _331 = _191 + _329;
        _243 = _331;
    }
    float _333 = _243;
    float _335 = _327 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _337 = precise::clamp(_335, 0.0, 1.0);
    float _339 = fma(_337, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _341 = _73 * _301;
    float _343 = _73 * _307;
    float _345 = _339 * _341;
    float _347 = 0.0 + _223;
    float _349 = precise::clamp(_347, 0.0, 1.0);
    float _351 = _349;
    if (_325)
    {
        float _353 = _333 * 8.0;
        float _355 = precise::clamp(_353, 0.0, 1.0);
        _245 = _355;
    }
    float _357 = _245;
    float _359 = _73 * _313;
    float _361 = _73 * _321;
    float _363 = fma(_269, _345, _343);
    if (_325)
    {
        float _365 = _349 * _357;
        _351 = _365;
    }
    float _367 = _351;
    float _369 = fma(_281, _345, _359);
    float _371 = fma(_293, _345, _361);
    float _373 = 0.0 + _367;
    float _375 = precise::clamp(_373, 0.0, 1.0);
    out.m_50.x = _363;
    out.m_50.y = _369;
    out.m_50.z = _371;
    out.m_50.w = _375;
    return out;
}

