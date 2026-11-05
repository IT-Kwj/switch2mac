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
    constant _16* fp_c10 [[id(0)]];
    constant _16* fp_c8 [[id(1)]];
    constant _16* fp_c9 [[id(2)]];
    constant _16* fp_c7 [[id(3)]];
    constant _16* fp_c15 [[id(4)]];
    texture2d<float> fp_t_tcb_8 [[id(5)]];
    sampler fp_t_tcb_8Smplr [[id(6)]];
    texture2d<float> fp_t_tcb_34 [[id(7)]];
    sampler fp_t_tcb_34Smplr [[id(8)]];
    sampler fp_t_tcb_8Smplr_w [[id(9)]];
    sampler fp_t_tcb_34Smplr_w [[id(10)]];
    constant dm_border_t* dm_border [[id(11)]];
};

struct main0_out
{
    float4 m_48 [[color(0)]];
};

struct main0_in
{
    float4 m_39 [[user(locn0)]];
    float4 m_45 [[user(locn1)]];
    float4 m_52 [[user(locn2)]];
    float4 m_41 [[user(locn3)]];
    float4 m_43 [[user(locn5)]];
    float4 m_50 [[user(locn6)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _59 = gl_FragCoord.w;
    float _61 = in.m_39.x;
    float _63 = gl_FragCoord.w;
    float _65 = _61 * _63;
    float _67 = in.m_39.y;
    float _69 = gl_FragCoord.w;
    float _71 = _67 * _69;
    float _73 = 1.0 / _59;
    float _75 = _73 * _65;
    float _77 = _73 * _71;
    float2 _425 = float2(_75, _77);
    float _79 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_425, float2(0.0), isnan(_425))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_425, float2(0.0), isnan(_425))).w;
    float _81 = in.m_41.x;
    float _83 = gl_FragCoord.w;
    float _85 = _81 * _83;
    float _87 = _73 * _85;
    float _89 = -(*spvDescriptorSet0.fp_c10)._m0[8].w;
    float _91 = (*spvDescriptorSet0.fp_c8)._m0[29].x + _89;
    float _93 = -(*spvDescriptorSet0.fp_c10)._m0[10].w;
    float _95 = (*spvDescriptorSet0.fp_c8)._m0[29].z + _93;
    float _97 = in.m_43.y;
    float _99 = gl_FragCoord.w;
    float _101 = _97 * _99;
    float _103 = in.m_43.x;
    float _105 = gl_FragCoord.w;
    float _107 = _103 * _105;
    float _109 = in.m_43.z;
    float _111 = gl_FragCoord.w;
    float _113 = _109 * _111;
    float _115 = _73 * _101;
    float _117 = 0.0 + _79;
    float _119 = precise::clamp(_117, 0.0, 1.0);
    float _121 = _119 * _87;
    bool _125 = _121 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _127 = isnan(_121);
    bool _129 = _125 || _127;
    bool _131 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _133 = _129 || _131;
    float _135 = -(*spvDescriptorSet0.fp_c10)._m0[9].w;
    float _137 = (*spvDescriptorSet0.fp_c8)._m0[29].y + _135;
    if (!_133)
    {
        discard_fragment();
    }
    float _139 = _137 * _137;
    float _141 = fma(_91, _91, _139);
    float _143 = fma(_95, _95, _141);
    float _145 = rsqrt(_143);
    float _147 = (*spvDescriptorSet0.fp_c8)._m0[1].y * (*spvDescriptorSet0.fp_c8)._m0[1].y;
    float _149 = fma((*spvDescriptorSet0.fp_c8)._m0[1].x, (*spvDescriptorSet0.fp_c8)._m0[1].x, _147);
    float _151 = _137 * _145;
    float _153 = _95 * _145;
    float _155 = _91 * _145;
    float _157 = fma((*spvDescriptorSet0.fp_c8)._m0[1].z, (*spvDescriptorSet0.fp_c8)._m0[1].z, _149);
    float _159 = rsqrt(_157);
    float _161 = _159 * (*spvDescriptorSet0.fp_c8)._m0[1].z;
    float _163 = _159 * (*spvDescriptorSet0.fp_c8)._m0[1].x;
    float _165 = _159 * (*spvDescriptorSet0.fp_c8)._m0[1].y;
    float _167 = _73 * _113;
    float _169 = _161 * _151;
    float _171 = _163 * _153;
    float _173 = -_169;
    float _175 = fma(_165, _153, _173);
    float _177 = _165 * _155;
    float _179 = -_171;
    float _181 = fma(_161, _155, _179);
    float _183 = _73 * _107;
    float _185 = -(*spvDescriptorSet0.fp_c10)._m0[9].w;
    float _187 = _115 + _185;
    float _189 = -_177;
    float _191 = fma(_163, _151, _189);
    float _193 = -(*spvDescriptorSet0.fp_c10)._m0[10].w;
    float _195 = _167 + _193;
    float _197 = -(*spvDescriptorSet0.fp_c10)._m0[8].w;
    float _199 = _183 + _197;
    float _201 = _181 * _187;
    float _203 = _155 * _191;
    float _205 = _153 * _181;
    float _207 = fma(_175, _199, _201);
    float _209 = -_203;
    float _211 = fma(_153, _175, _209);
    float _213 = fma(_191, _195, _207);
    float _215 = -_205;
    float _217 = fma(_151, _191, _215);
    float _219 = _151 * _175;
    float _221 = _187 * _211;
    float _223 = -_219;
    float _225 = fma(_155, _181, _223);
    float _227 = fma(_199, _217, _221);
    float _229 = fma(_195, _225, _227);
    float _231 = -_229;
    float _233 = _231 + 0.5;
    float _235 = fma((*spvDescriptorSet0.fp_c10)._m0[2].x, 0.00999999977648258209228515625, (*spvDescriptorSet0.fp_c7)._m0[0].x);
    float _237 = fma(_213, 0.20000000298023223876953125, 0.100000001490116119384765625);
    float _239 = _235 + _237;
    float2 _696 = float2(_239, _233);
    float3 _243 = dm_bs(spvDescriptorSet0.fp_t_tcb_34.sample(spvDescriptorSet0.fp_t_tcb_34Smplr, select(_696, float2(0.0), isnan(_696))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_34, spvDescriptorSet0.fp_t_tcb_34Smplr_w, select(_696, float2(0.0), isnan(_696))).xyz;
    float _245 = _243.x;
    float _247 = _243.y;
    float _249 = _243.z;
    float _251 = in.m_45.x;
    float _253 = gl_FragCoord.w;
    float _255 = _251 * _253;
    float _257 = in.m_45.y;
    float _259 = gl_FragCoord.w;
    float _261 = _257 * _259;
    float _263 = in.m_45.z;
    float _265 = gl_FragCoord.w;
    float _267 = _263 * _265;
    float _269 = _73 * _255;
    float _271 = _73 * _261;
    float _273 = _73 * _267;
    float _275 = _245 + _269;
    float _277 = _247 + _271;
    float _279 = _249 + _273;
    if (!_133)
    {
        out.m_48.x = _275;
        out.m_48.y = _277;
        out.m_48.z = _279;
        out.m_48.w = _79;
        return out;
    }
    float _281 = _277 * 0.715200006961822509765625;
    float _283 = in.m_50.w;
    float _285 = gl_FragCoord.w;
    float _287 = _283 * _285;
    float _289 = in.m_50.x;
    float _291 = gl_FragCoord.w;
    float _293 = _289 * _291;
    float _295 = in.m_50.y;
    float _297 = gl_FragCoord.w;
    float _299 = _295 * _297;
    float _301 = fma(_275, 0.2125999927520751953125, _281);
    float _303 = in.m_50.z;
    float _305 = gl_FragCoord.w;
    float _307 = _303 * _305;
    float _309 = 0.0 + _121;
    float _311 = precise::clamp(_309, 0.0, 1.0);
    float _313 = fma(_279, 0.072200000286102294921875, _301);
    bool _315 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _317 = 1.0 / _313;
    float _319 = _317 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _321 = precise::clamp(_319, 0.0, 1.0);
    float _323 = fma(_321, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _325 = _73 * _287;
    float _327 = _323 * _325;
    float _329 = _73 * _293;
    float _331 = _73 * _299;
    float _333 = _73 * _307;
    float _335 = fma(_275, _327, _329);
    float _337 = fma(_277, _327, _331);
    float _339 = fma(_279, _327, _333);
    float _341 = _331;
    if (!_315)
    {
        _341 = _311;
    }
    float _343 = _341;
    bool _345 = !_315;
    float _347 = _343;
    if (!_345)
    {
        float _349 = in.m_52.w;
        float _351 = gl_FragCoord.w;
        float _353 = _349 * _351;
        float _355 = in.m_52.z;
        float _357 = gl_FragCoord.w;
        float _359 = _355 * _357;
        float _361 = _73 * _353;
        float _363 = _73 * _359;
        float _365 = 1.0 / _361;
        float _367 = _363 * _365;
        float _369 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _371 = fma(_367, (*spvDescriptorSet0.fp_c8)._m0[30].w, _369);
        float _373 = 1.0 / _371;
        float _375 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _377 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _379 = fma(_373, _375, _377);
        float _381 = _379 * 8.0;
        float _383 = precise::clamp(_381, 0.0, 1.0);
        float _385 = _311 * _383;
        _347 = _385;
    }
    float _387 = _347;
    float _389 = 0.0 + _387;
    float _391 = precise::clamp(_389, 0.0, 1.0);
    out.m_48.x = _335;
    out.m_48.y = _337;
    out.m_48.z = _339;
    out.m_48.w = _391;
    return out;
}

