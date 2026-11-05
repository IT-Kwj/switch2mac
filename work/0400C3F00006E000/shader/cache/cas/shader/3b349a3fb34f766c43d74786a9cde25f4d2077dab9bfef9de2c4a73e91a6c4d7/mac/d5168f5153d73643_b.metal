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
    float4 m_48 [[color(0)]];
};

struct main0_in
{
    float4 m_41 [[user(locn0)]];
    float4 m_45 [[user(locn1)]];
    float4 m_37 [[user(locn2)]];
    float4 m_43 [[user(locn3)]];
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
    float _71 = in.m_39.x;
    float _73 = gl_FragCoord.w;
    float _75 = _71 * _73;
    float _77 = in.m_39.y;
    float _79 = gl_FragCoord.w;
    float _81 = _77 * _79;
    float _83 = in.m_37.y;
    float _85 = gl_FragCoord.w;
    float _87 = _83 * _85;
    float _89 = in.m_39.z;
    float _91 = gl_FragCoord.w;
    float _93 = _89 * _91;
    float _95 = in.m_39.w;
    float _97 = gl_FragCoord.w;
    float _99 = _95 * _97;
    float _101 = 1.0 / _57;
    float _103 = _101 * _63;
    float _105 = _101 * _69;
    float _107 = _101 * _75;
    float _109 = _101 * _81;
    float _111 = _101 * _87;
    float _113 = _101 * _93;
    float _115 = 1.0 / _103;
    float _117 = _101 * _99;
    float _119 = _105 * _115;
    float _121 = _111 * _115;
    float2 _493;
    _493.x = spvDescriptorSet0.fp_t_tcb_8.calculate_clamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_107, _109));
    _493.y = spvDescriptorSet0.fp_t_tcb_8.calculate_unclamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_107, _109));
    float _123 = _493.x;
    float _125 = _123 * 256.0;
    int _128 = int(_125);
    float2 _503 = float2(_119, _121);
    float _130 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_503, float2(0.0), isnan(_503))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_503, float2(0.0), isnan(_503))).x;
    float2 _514 = float2(_113, _117);
    float4 _133 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_514, float2(0.0), isnan(_514))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_514, float2(0.0), isnan(_514))).xyzw;
    float _135 = _133.x;
    float _137 = _133.y;
    float _139 = _133.z;
    float _141 = _133.w;
    float _143 = float(uint(_128));
    float _145 = _143 * 0.00390625;
    float _147 = precise::min(_145, 2.0);
    float2 _540 = float2(_107, _109);
    float4 _149 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_540, float2(0.0), isnan(_540)), level(_147)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_540, float2(0.0), isnan(_540)), level(_147)).xyzw;
    float _151 = _149.x;
    float _153 = _149.y;
    float _155 = _149.z;
    float _157 = _149.w;
    float _159 = in.m_37.z;
    float _161 = gl_FragCoord.w;
    float _163 = _159 * _161;
    float _165 = in.m_41.w;
    float _167 = gl_FragCoord.w;
    float _169 = _165 * _167;
    float _171 = _101 * _163;
    float _173 = in.m_43.x;
    float _175 = gl_FragCoord.w;
    float _177 = _173 * _175;
    float _179 = _171 * _115;
    float _181 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _183 = fma(_179, (*spvDescriptorSet0.fp_c8)._m0[30].w, _181);
    float _185 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _187 = fma(_130, (*spvDescriptorSet0.fp_c8)._m0[30].w, _185);
    float _189 = 1.0 / _183;
    float _191 = 1.0 / _187;
    float _193 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[142].y;
    float _195 = _101 * _169;
    float _197 = in.m_41.z;
    float _199 = gl_FragCoord.w;
    float _201 = _197 * _199;
    float _203 = in.m_45.x;
    float _205 = gl_FragCoord.w;
    float _207 = _203 * _205;
    float _209 = in.m_45.z;
    float _211 = gl_FragCoord.w;
    float _213 = _209 * _211;
    float _215 = _157 * _141;
    float _217 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _219 = _189 * _217;
    float _221 = _215 * _195;
    float _223 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _225 = -_219;
    float _227 = fma(_191, _223, _225);
    float _229 = 0.0 + _221;
    float _231 = precise::clamp(_229, 0.0, 1.0);
    float _233 = _227 * _193;
    float _235 = precise::clamp(_233, 0.0, 1.0);
    float _237 = _101 * _177;
    float _239 = _231 * _235;
    float _241 = _239 * _237;
    bool _245 = _241 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _247 = isnan(_241);
    bool _249 = _245 || _247;
    bool _251 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _253 = _249 || _251;
    float _255 = in.m_41.x;
    float _257 = gl_FragCoord.w;
    float _259 = _255 * _257;
    float _261 = in.m_41.y;
    float _263 = gl_FragCoord.w;
    float _265 = _261 * _263;
    float _267 = in.m_45.y;
    float _269 = gl_FragCoord.w;
    float _271 = _267 * _269;
    float _273 = _219;
    if (!_253)
    {
        discard_fragment();
    }
    float _275 = _135 * _135;
    float _277 = _137 * _137;
    float _279 = _101 * _207;
    float _281 = _101 * _213;
    float _283 = _151 * _275;
    float _285 = _153 * _277;
    float _287 = _139 * _139;
    float _289 = _101 * _201;
    float _291 = -_281;
    float _293 = _289 + _291;
    float _295 = _101 * _259;
    float _297 = _101 * _265;
    float _299 = _101 * _271;
    float _301 = _155 * _287;
    float _303 = -_279;
    float _305 = _295 + _303;
    float _307 = -_299;
    float _309 = _297 + _307;
    float _311 = fma(_301, _293, _281);
    float _313 = fma(_283, _305, _279);
    float _315 = fma(_285, _309, _299);
    if (!_253)
    {
        out.m_48.x = _313;
        out.m_48.y = _315;
        out.m_48.z = _311;
        out.m_48.w = _221;
        return out;
    }
    float _317 = _315 * 0.715200006961822509765625;
    float _319 = in.m_50.w;
    float _321 = gl_FragCoord.w;
    float _323 = _319 * _321;
    float _325 = in.m_50.x;
    float _327 = gl_FragCoord.w;
    float _329 = _325 * _327;
    float _331 = in.m_50.y;
    float _333 = gl_FragCoord.w;
    float _335 = _331 * _333;
    float _337 = fma(_313, 0.2125999927520751953125, _317);
    float _339 = in.m_50.z;
    float _341 = gl_FragCoord.w;
    float _343 = _339 * _341;
    float _345 = fma(_311, 0.072200000286102294921875, _337);
    bool _347 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _349 = 1.0 / _345;
    float _351 = (*spvDescriptorSet0.fp_c15)._m0[2].y;
    if (_347)
    {
        float _353 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _355 = _219 + _353;
        _273 = _355;
    }
    float _357 = _273;
    float _359 = _349 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _361 = precise::clamp(_359, 0.0, 1.0);
    float _363 = fma(_361, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _365 = _101 * _323;
    if (_347)
    {
        float _367 = _357 * 8.0;
        float _369 = precise::clamp(_367, 0.0, 1.0);
        _351 = _369;
    }
    float _371 = _351;
    float _373 = _101 * _329;
    float _375 = _101 * _335;
    float _377 = _363 * _365;
    float _379 = 0.0 + _241;
    float _381 = precise::clamp(_379, 0.0, 1.0);
    float _383 = _101 * _343;
    float _385 = fma(_313, _377, _373);
    float _387 = _381;
    if (_347)
    {
        float _389 = _381 * _371;
        _387 = _389;
    }
    float _391 = _387;
    float _393 = fma(_315, _377, _375);
    float _395 = fma(_311, _377, _383);
    float _397 = 0.0 + _391;
    float _399 = precise::clamp(_397, 0.0, 1.0);
    out.m_48.x = _385;
    out.m_48.y = _393;
    out.m_48.z = _395;
    out.m_48.w = _399;
    return out;
}

