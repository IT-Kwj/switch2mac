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
    texture2d<float> fp_t_tcb_C [[id(7)]];
    sampler fp_t_tcb_CSmplr [[id(8)]];
    texture2d<float> fp_t_tcb_A [[id(9)]];
    sampler fp_t_tcb_ASmplr [[id(10)]];
    sampler fp_t_tcb_10Smplr_w [[id(11)]];
    sampler fp_t_tcb_8Smplr_w [[id(12)]];
    sampler fp_t_tcb_CSmplr_w [[id(13)]];
    sampler fp_t_tcb_ASmplr_w [[id(14)]];
    constant dm_border_t* dm_border [[id(15)]];
};

struct main0_out
{
    float4 m_52 [[color(0)]];
};

struct main0_in
{
    float4 m_45 [[user(locn0)]];
    float4 m_47 [[user(locn1)]];
    float4 m_39 [[user(locn2)]];
    float4 m_49 [[user(locn3)]];
    float4 m_41 [[user(locn4)]];
    float4 m_43 [[user(locn5)]];
    float4 m_54 [[user(locn7)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _61 = gl_FragCoord.w;
    float _63 = in.m_39.w;
    float _65 = gl_FragCoord.w;
    float _67 = _63 * _65;
    float _69 = in.m_39.x;
    float _71 = gl_FragCoord.w;
    float _73 = _69 * _71;
    float _75 = in.m_39.y;
    float _77 = gl_FragCoord.w;
    float _79 = _75 * _77;
    float _81 = in.m_41.x;
    float _83 = gl_FragCoord.w;
    float _85 = _81 * _83;
    float _87 = in.m_43.y;
    float _89 = gl_FragCoord.w;
    float _91 = _87 * _89;
    float _93 = in.m_41.y;
    float _95 = gl_FragCoord.w;
    float _97 = _93 * _95;
    float _99 = in.m_43.x;
    float _101 = gl_FragCoord.w;
    float _103 = _99 * _101;
    float _105 = 1.0 / _61;
    float _107 = _105 * _67;
    float _109 = _105 * _73;
    float _111 = _105 * _79;
    float _113 = _105 * _85;
    float _115 = _105 * _91;
    float _117 = _105 * _97;
    float _119 = 1.0 / _107;
    float _121 = _105 * _103;
    float _123 = _109 * _119;
    float _125 = _111 * _119;
    float2 _495 = float2(_123, _125);
    float _127 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_495, float2(0.0), isnan(_495))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_495, float2(0.0), isnan(_495))).x;
    float2 _506 = float2(_113, _117);
    float _129 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_506, float2(0.0), isnan(_506))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_506, float2(0.0), isnan(_506))).w;
    float2 _514 = float2(_121, _115);
    float _131 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_514, float2(0.0), isnan(_514))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_514, float2(0.0), isnan(_514))).w;
    float _133 = in.m_39.z;
    float _135 = gl_FragCoord.w;
    float _137 = _133 * _135;
    float _139 = in.m_45.w;
    float _141 = gl_FragCoord.w;
    float _143 = _139 * _141;
    float _145 = in.m_47.w;
    float _147 = gl_FragCoord.w;
    float _149 = _145 * _147;
    float _151 = _105 * _137;
    float _153 = in.m_49.x;
    float _155 = gl_FragCoord.w;
    float _157 = _153 * _155;
    float _159 = _151 * _119;
    float _161 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[142].y;
    float _163 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _165 = fma(_159, (*spvDescriptorSet0.fp_c8)._m0[30].w, _163);
    float _167 = 1.0 / _165;
    float _169 = _105 * _143;
    float _171 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _173 = _167 * _171;
    float _175 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _177 = fma(_127, (*spvDescriptorSet0.fp_c8)._m0[30].w, _175);
    float _179 = _129 * _131;
    float _181 = 1.0 / _177;
    float _183 = _179 * _169;
    float _185 = _105 * _149;
    float _187 = _185 * _183;
    float _189 = _105 * _157;
    float _191 = 0.0 + _187;
    float _193 = precise::clamp(_191, 0.0, 1.0);
    float _195 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _197 = -_173;
    float _199 = fma(_181, _195, _197);
    float _201 = _199 * _161;
    float _203 = precise::clamp(_201, 0.0, 1.0);
    float _205 = _193 * _203;
    float _207 = _205 * _189;
    bool _211 = _207 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _213 = isnan(_207);
    bool _215 = _211 || _213;
    bool _217 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _219 = _215 || _217;
    float _221 = in.m_41.z;
    float _223 = gl_FragCoord.w;
    float _225 = _221 * _223;
    float _227 = in.m_41.w;
    float _229 = gl_FragCoord.w;
    float _231 = _227 * _229;
    float _233 = _173;
    if (!_219)
    {
        discard_fragment();
    }
    float _235 = _105 * _225;
    float _237 = _105 * _231;
    float2 _673 = float2(_235, _237);
    float3 _241 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_673, float2(0.0), isnan(_673))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_673, float2(0.0), isnan(_673))).xyz;
    float _243 = _241.x;
    float _245 = _241.y;
    float _247 = _241.z;
    float _249 = in.m_47.x;
    float _251 = gl_FragCoord.w;
    float _253 = _249 * _251;
    float _255 = in.m_45.x;
    float _257 = gl_FragCoord.w;
    float _259 = _255 * _257;
    float _261 = in.m_45.y;
    float _263 = gl_FragCoord.w;
    float _265 = _261 * _263;
    float _267 = in.m_47.y;
    float _269 = gl_FragCoord.w;
    float _271 = _267 * _269;
    float _273 = in.m_45.z;
    float _275 = gl_FragCoord.w;
    float _277 = _273 * _275;
    float _279 = in.m_47.z;
    float _281 = gl_FragCoord.w;
    float _283 = _279 * _281;
    float _285 = _105 * _253;
    float _287 = _105 * _259;
    float _289 = _105 * _265;
    float _291 = _105 * _271;
    float _293 = _105 * _277;
    float _295 = _105 * _283;
    float _297 = -_285;
    float _299 = _287 + _297;
    float _301 = -_291;
    float _303 = _289 + _301;
    float _305 = -_295;
    float _307 = _293 + _305;
    float _309 = _243 * _243;
    float _311 = _245 * _245;
    float _313 = _247 * _247;
    float _315 = fma(_309, _299, _285);
    float _317 = fma(_311, _303, _291);
    float _319 = fma(_313, _307, _295);
    if (!_219)
    {
        out.m_52.x = _315;
        out.m_52.y = _317;
        out.m_52.z = _319;
        out.m_52.w = _187;
        return out;
    }
    float _321 = _317 * 0.715200006961822509765625;
    float _323 = in.m_54.w;
    float _325 = gl_FragCoord.w;
    float _327 = _323 * _325;
    float _329 = in.m_54.x;
    float _331 = gl_FragCoord.w;
    float _333 = _329 * _331;
    float _335 = in.m_54.y;
    float _337 = gl_FragCoord.w;
    float _339 = _335 * _337;
    float _341 = fma(_315, 0.2125999927520751953125, _321);
    float _343 = in.m_54.z;
    float _345 = gl_FragCoord.w;
    float _347 = _343 * _345;
    float _349 = fma(_319, 0.072200000286102294921875, _341);
    bool _351 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _353 = 1.0 / _349;
    float _355 = (*spvDescriptorSet0.fp_c15)._m0[2].y;
    if (_351)
    {
        float _357 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _359 = _173 + _357;
        _233 = _359;
    }
    float _361 = _233;
    float _363 = _353 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _365 = precise::clamp(_363, 0.0, 1.0);
    float _367 = fma(_365, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _369 = _105 * _327;
    if (_351)
    {
        float _371 = _361 * 8.0;
        float _373 = precise::clamp(_371, 0.0, 1.0);
        _355 = _373;
    }
    float _375 = _355;
    float _377 = _105 * _339;
    float _379 = _367 * _369;
    float _381 = 0.0 + _207;
    float _383 = precise::clamp(_381, 0.0, 1.0);
    float _385 = _105 * _333;
    float _387 = _105 * _347;
    float _389 = fma(_317, _379, _377);
    float _391 = _383;
    if (_351)
    {
        float _393 = _383 * _375;
        _391 = _393;
    }
    float _395 = _391;
    float _397 = fma(_315, _379, _385);
    float _399 = fma(_319, _379, _387);
    float _401 = 0.0 + _395;
    float _403 = precise::clamp(_401, 0.0, 1.0);
    out.m_52.x = _397;
    out.m_52.y = _389;
    out.m_52.z = _399;
    out.m_52.w = _403;
    return out;
}

