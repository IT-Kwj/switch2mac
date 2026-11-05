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
    texture2d<float> fp_t_tcb_34 [[id(3)]];
    sampler fp_t_tcb_34Smplr [[id(4)]];
    texture2d<float> fp_t_tcb_36 [[id(5)]];
    sampler fp_t_tcb_36Smplr [[id(6)]];
    texture2d<float> fp_t_tcb_C [[id(7)]];
    sampler fp_t_tcb_CSmplr [[id(8)]];
    texture2d<float> fp_t_tcb_8 [[id(9)]];
    sampler fp_t_tcb_8Smplr [[id(10)]];
    texture2d<float> fp_t_tcb_A [[id(11)]];
    sampler fp_t_tcb_ASmplr [[id(12)]];
    sampler fp_t_tcb_34Smplr_w [[id(13)]];
    sampler fp_t_tcb_36Smplr_w [[id(14)]];
    sampler fp_t_tcb_CSmplr_w [[id(15)]];
    sampler fp_t_tcb_8Smplr_w [[id(16)]];
    sampler fp_t_tcb_ASmplr_w [[id(17)]];
    constant dm_border_t* dm_border [[id(18)]];
};

struct main0_out
{
    float4 m_56 [[color(0)]];
};

struct main0_in
{
    float4 m_49 [[user(locn0)]];
    float4 m_51 [[user(locn1)]];
    float4 m_60 [[user(locn2)]];
    float4 m_53 [[user(locn3)]];
    float4 m_47 [[user(locn4)]];
    float4 m_45 [[user(locn5)]];
    float4 m_41 [[user(locn6)]];
    float4 m_43 [[user(locn7)]];
    float4 m_58 [[user(locn9)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _67 = gl_FragCoord.w;
    float _69 = in.m_41.x;
    float _71 = gl_FragCoord.w;
    float _73 = _69 * _71;
    float _75 = in.m_41.y;
    float _77 = gl_FragCoord.w;
    float _79 = _75 * _77;
    float _81 = in.m_43.y;
    float _83 = gl_FragCoord.w;
    float _85 = _81 * _83;
    float _87 = in.m_45.x;
    float _89 = gl_FragCoord.w;
    float _91 = _87 * _89;
    float _93 = in.m_43.x;
    float _95 = gl_FragCoord.w;
    float _97 = _93 * _95;
    float _99 = in.m_45.y;
    float _101 = gl_FragCoord.w;
    float _103 = _99 * _101;
    float _105 = in.m_47.x;
    float _107 = gl_FragCoord.w;
    float _109 = _105 * _107;
    float _111 = in.m_47.y;
    float _113 = gl_FragCoord.w;
    float _115 = _111 * _113;
    float _117 = 1.0 / _67;
    float _119 = _117 * _73;
    float _121 = _117 * _79;
    float _123 = _117 * _85;
    float _125 = _117 * _91;
    float _127 = _117 * _97;
    float _129 = _117 * _103;
    float2 _459 = float2(_119, _121);
    float _131 = dm_bs(spvDescriptorSet0.fp_t_tcb_34.sample(spvDescriptorSet0.fp_t_tcb_34Smplr, select(_459, float2(0.0), isnan(_459))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_34, spvDescriptorSet0.fp_t_tcb_34Smplr_w, select(_459, float2(0.0), isnan(_459))).w;
    float _133 = _117 * _109;
    float2 _473 = float2(_127, _123);
    float _135 = dm_bs(spvDescriptorSet0.fp_t_tcb_36.sample(spvDescriptorSet0.fp_t_tcb_36Smplr, select(_473, float2(0.0), isnan(_473))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_36, spvDescriptorSet0.fp_t_tcb_36Smplr_w, select(_473, float2(0.0), isnan(_473))).w;
    float2 _481 = float2(_125, _129);
    float _137 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_481, float2(0.0), isnan(_481))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_481, float2(0.0), isnan(_481))).w;
    float _139 = _117 * _115;
    float2 _492 = float2(_133, _139);
    float _141 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_492, float2(0.0), isnan(_492))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_492, float2(0.0), isnan(_492))).w;
    float _143 = in.m_49.w;
    float _145 = gl_FragCoord.w;
    float _147 = _143 * _145;
    float _149 = in.m_51.w;
    float _151 = gl_FragCoord.w;
    float _153 = _149 * _151;
    float _155 = in.m_53.x;
    float _157 = gl_FragCoord.w;
    float _159 = _155 * _157;
    float _161 = in.m_47.z;
    float _163 = gl_FragCoord.w;
    float _165 = _161 * _163;
    float _167 = _117 * _165;
    float _169 = _131 + _135;
    float _171 = _137 * _137;
    float _173 = _117 * _153;
    float _175 = fma(_137, _171, _169);
    float _177 = precise::clamp(_175, 0.0, 1.0);
    float _179 = _117 * _147;
    float _181 = -_179;
    float _183 = fma(_177, _141, _181);
    float _185 = _117 * _159;
    float _187 = _183 * _173;
    float _189 = 0.0 + _187;
    float _191 = precise::clamp(_189, 0.0, 1.0);
    float _193 = _191 * _185;
    bool _197 = _193 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _199 = isnan(_193);
    bool _201 = _197 || _199;
    bool _203 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _205 = _201 || _203;
    float _207 = in.m_47.w;
    float _209 = gl_FragCoord.w;
    float _211 = _207 * _209;
    if (!_205)
    {
        discard_fragment();
    }
    float _213 = _117 * _211;
    float2 _601 = float2(_167, _213);
    float3 _217 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_601, float2(0.0), isnan(_601))), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_601, float2(0.0), isnan(_601))).xyz;
    float _219 = _217.x;
    float _221 = _217.y;
    float _223 = _217.z;
    float _225 = in.m_49.y;
    float _227 = gl_FragCoord.w;
    float _229 = _225 * _227;
    float _231 = in.m_49.x;
    float _233 = gl_FragCoord.w;
    float _235 = _231 * _233;
    float _237 = in.m_49.z;
    float _239 = gl_FragCoord.w;
    float _241 = _237 * _239;
    float _243 = _117 * _229;
    float _245 = _117 * _235;
    float _247 = _117 * _241;
    float _249 = fma(_219, (*spvDescriptorSet0.fp_c9)._m0[106].x, _245);
    float _251 = fma(_221, (*spvDescriptorSet0.fp_c9)._m0[106].x, _243);
    float _253 = fma(_223, (*spvDescriptorSet0.fp_c9)._m0[106].x, _247);
    float _255 = _249 + _169;
    float _257 = _251 + _169;
    float _259 = _253 + _169;
    if (!_205)
    {
        out.m_56.x = _255;
        out.m_56.y = _257;
        out.m_56.z = _259;
        out.m_56.w = _187;
        return out;
    }
    float _261 = _257 * 0.715200006961822509765625;
    float _263 = in.m_58.w;
    float _265 = gl_FragCoord.w;
    float _267 = _263 * _265;
    float _269 = in.m_58.z;
    float _271 = gl_FragCoord.w;
    float _273 = _269 * _271;
    float _275 = in.m_58.x;
    float _277 = gl_FragCoord.w;
    float _279 = _275 * _277;
    float _281 = fma(_255, 0.2125999927520751953125, _261);
    float _283 = in.m_58.y;
    float _285 = gl_FragCoord.w;
    float _287 = _283 * _285;
    float _289 = fma(_259, 0.072200000286102294921875, _281);
    bool _291 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _293 = 1.0 / _289;
    float _295 = _293 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _297 = precise::clamp(_295, 0.0, 1.0);
    float _299 = _117 * _267;
    float _301 = fma(_297, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _303 = _117 * _273;
    float _305 = _301 * _299;
    float _307 = 0.0 + _193;
    float _309 = precise::clamp(_307, 0.0, 1.0);
    float _311 = _117 * _279;
    float _313 = _117 * _287;
    float _315 = fma(_259, _305, _303);
    float _317 = fma(_255, _305, _311);
    float _319 = fma(_257, _305, _313);
    float _321 = _303;
    if (!_291)
    {
        _321 = _309;
    }
    float _323 = _321;
    bool _325 = !_291;
    float _327 = _323;
    if (!_325)
    {
        float _329 = in.m_60.w;
        float _331 = gl_FragCoord.w;
        float _333 = _329 * _331;
        float _335 = in.m_60.z;
        float _337 = gl_FragCoord.w;
        float _339 = _335 * _337;
        float _341 = _117 * _333;
        float _343 = _117 * _339;
        float _345 = 1.0 / _341;
        float _347 = _343 * _345;
        float _349 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _351 = fma(_347, (*spvDescriptorSet0.fp_c8)._m0[30].w, _349);
        float _353 = 1.0 / _351;
        float _355 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _357 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _359 = fma(_353, _355, _357);
        float _361 = _359 * 8.0;
        float _363 = precise::clamp(_361, 0.0, 1.0);
        float _365 = _309 * _363;
        _327 = _365;
    }
    float _367 = _327;
    float _369 = 0.0 + _367;
    float _371 = precise::clamp(_369, 0.0, 1.0);
    out.m_56.x = _317;
    out.m_56.y = _319;
    out.m_56.z = _315;
    out.m_56.w = _371;
    return out;
}

