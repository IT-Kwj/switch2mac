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
    texture2d<float> fp_t_tcb_C [[id(5)]];
    sampler fp_t_tcb_CSmplr [[id(6)]];
    texture2d<float> fp_t_tcb_8 [[id(7)]];
    sampler fp_t_tcb_8Smplr [[id(8)]];
    texture2d<float> fp_t_tcb_A [[id(9)]];
    sampler fp_t_tcb_ASmplr [[id(10)]];
    sampler fp_t_tcb_10Smplr_w [[id(11)]];
    sampler fp_t_tcb_CSmplr_w [[id(12)]];
    sampler fp_t_tcb_8Smplr_w [[id(13)]];
    sampler fp_t_tcb_ASmplr_w [[id(14)]];
    constant dm_border_t* dm_border [[id(15)]];
};

struct main0_out
{
    float4 m_54 [[color(0)]];
};

struct main0_in
{
    float4 m_47 [[user(locn0)]];
    float4 m_49 [[user(locn1)]];
    float4 m_39 [[user(locn2)]];
    float4 m_51 [[user(locn3)]];
    float4 m_41 [[user(locn4)]];
    float4 m_45 [[user(locn5), flat]];
    float4 m_43 [[user(locn6)]];
    float4 m_56 [[user(locn8)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _63 = gl_FragCoord.w;
    float _65 = in.m_39.w;
    float _67 = gl_FragCoord.w;
    float _69 = _65 * _67;
    float _71 = in.m_39.x;
    float _73 = gl_FragCoord.w;
    float _75 = _71 * _73;
    float _77 = in.m_39.y;
    float _79 = gl_FragCoord.w;
    float _81 = _77 * _79;
    float _83 = in.m_41.y;
    float _85 = gl_FragCoord.w;
    float _87 = _83 * _85;
    float _89 = in.m_41.z;
    float _91 = gl_FragCoord.w;
    float _93 = _89 * _91;
    float _95 = in.m_43.y;
    float _97 = gl_FragCoord.w;
    float _99 = _95 * _97;
    float _101 = in.m_43.x;
    float _103 = gl_FragCoord.w;
    float _105 = _101 * _103;
    float _107 = in.m_41.x;
    float _109 = gl_FragCoord.w;
    float _111 = _107 * _109;
    float _113 = in.m_41.w;
    float _115 = gl_FragCoord.w;
    float _117 = _113 * _115;
    float _119 = 1.0 / _63;
    float _121 = _119 * _69;
    float _123 = _119 * _75;
    float _125 = _119 * _81;
    float _127 = _119 * _87;
    float _129 = 1.0 / _121;
    float _131 = _119 * _93;
    float _133 = _119 * _99;
    float _135 = _119 * _105;
    float _137 = _119 * _111;
    float _139 = _123 * _129;
    float _141 = _125 * _129;
    float _143 = _119 * _117;
    float2 _520 = float2(_139, _141);
    float _145 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_520, float2(0.0), isnan(_520))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_520, float2(0.0), isnan(_520))).x;
    float2 _531 = float2(_135, _133);
    float _147 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_531, float2(0.0), isnan(_531))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_531, float2(0.0), isnan(_531))).w;
    float2 _539 = float2(_137, _127);
    float _149 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_539, float2(0.0), isnan(_539))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_539, float2(0.0), isnan(_539))).w;
    float2 _547 = float2(_131, _143);
    float _151 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_547, float2(0.0), isnan(_547))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_547, float2(0.0), isnan(_547))).w;
    float _153 = in.m_39.z;
    float _155 = gl_FragCoord.w;
    float _157 = _153 * _155;
    float _159 = in.m_45.x;
    float _161 = in.m_47.w;
    float _163 = gl_FragCoord.w;
    float _165 = _161 * _163;
    float _167 = in.m_49.w;
    float _169 = gl_FragCoord.w;
    float _171 = _167 * _169;
    float _173 = in.m_51.x;
    float _175 = gl_FragCoord.w;
    float _177 = _173 * _175;
    float _179 = _119 * _157;
    float _181 = _179 * _129;
    float _183 = _159 + (-0.300000011920928955078125);
    float _185 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _187 = fma(_181, (*spvDescriptorSet0.fp_c8)._m0[30].w, _185);
    float _189 = 1.0 / _187;
    float _191 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _193 = fma(_145, (*spvDescriptorSet0.fp_c8)._m0[30].w, _191);
    float _195 = precise::max(_183, _147);
    float _197 = precise::min(_149, _151);
    float _199 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[142].y;
    float _201 = precise::min(_159, _195);
    float _203 = _119 * _165;
    float _205 = _119 * _171;
    float _207 = -_203;
    float _209 = _197 + _207;
    float _211 = -_183;
    float _213 = _211 + _201;
    float _215 = 1.0 / _193;
    float _217 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _219 = _189 * _217;
    float _221 = _205 * _209;
    float _223 = _213 * 3.3333332538604736328125;
    float _225 = _119 * _177;
    float _227 = _221 * _223;
    float _229 = 0.0 + _227;
    float _231 = precise::clamp(_229, 0.0, 1.0);
    float _233 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _235 = -_219;
    float _237 = fma(_215, _233, _235);
    float _239 = _237 * _199;
    float _241 = precise::clamp(_239, 0.0, 1.0);
    float _243 = _231 * _241;
    float _245 = _243 * _225;
    bool _249 = _245 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _251 = isnan(_245);
    bool _253 = _249 || _251;
    bool _255 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _257 = _253 || _255;
    float _259 = in.m_49.y;
    float _261 = gl_FragCoord.w;
    float _263 = _259 * _261;
    float _265 = in.m_49.x;
    float _267 = gl_FragCoord.w;
    float _269 = _265 * _267;
    float _271 = in.m_49.z;
    float _273 = gl_FragCoord.w;
    float _275 = _271 * _273;
    float _277 = in.m_47.x;
    float _279 = gl_FragCoord.w;
    float _281 = _277 * _279;
    float _283 = in.m_47.y;
    float _285 = gl_FragCoord.w;
    float _287 = _283 * _285;
    float _289 = in.m_47.z;
    float _291 = gl_FragCoord.w;
    float _293 = _289 * _291;
    float _295 = _219;
    if (!_257)
    {
        discard_fragment();
    }
    float _297 = -_197;
    float _299 = _297 + 1.0;
    float _301 = _119 * _263;
    float _303 = _119 * _269;
    float _305 = _119 * _275;
    float _307 = _301 * _299;
    float _309 = _303 * _299;
    float _311 = _305 * _299;
    float _313 = _119 * _281;
    float _315 = _119 * _287;
    float _317 = _119 * _293;
    float _319 = fma(_197, _313, _309);
    float _321 = fma(_197, _315, _307);
    float _323 = fma(_197, _317, _311);
    if (!_257)
    {
        out.m_54.x = _319;
        out.m_54.y = _321;
        out.m_54.z = _323;
        out.m_54.w = _227;
        return out;
    }
    float _325 = _321 * 0.715200006961822509765625;
    float _327 = in.m_56.w;
    float _329 = gl_FragCoord.w;
    float _331 = _327 * _329;
    float _333 = in.m_56.x;
    float _335 = gl_FragCoord.w;
    float _337 = _333 * _335;
    float _339 = in.m_56.y;
    float _341 = gl_FragCoord.w;
    float _343 = _339 * _341;
    float _345 = fma(_319, 0.2125999927520751953125, _325);
    float _347 = in.m_56.z;
    float _349 = gl_FragCoord.w;
    float _351 = _347 * _349;
    float _353 = fma(_323, 0.072200000286102294921875, _345);
    bool _355 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _357 = 1.0 / _353;
    float _359 = (*spvDescriptorSet0.fp_c15)._m0[2].y;
    if (_355)
    {
        float _361 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _363 = _219 + _361;
        _295 = _363;
    }
    float _365 = _295;
    float _367 = _357 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _369 = precise::clamp(_367, 0.0, 1.0);
    float _371 = fma(_369, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _373 = _119 * _331;
    if (_355)
    {
        float _375 = _365 * 8.0;
        float _377 = precise::clamp(_375, 0.0, 1.0);
        _359 = _377;
    }
    float _379 = _359;
    float _381 = _119 * _343;
    float _383 = _371 * _373;
    float _385 = 0.0 + _245;
    float _387 = precise::clamp(_385, 0.0, 1.0);
    float _389 = _119 * _337;
    float _391 = _119 * _351;
    float _393 = fma(_321, _383, _381);
    float _395 = _387;
    if (_355)
    {
        float _397 = _387 * _379;
        _395 = _397;
    }
    float _399 = _395;
    float _401 = fma(_319, _383, _389);
    float _403 = fma(_323, _383, _391);
    float _405 = 0.0 + _399;
    float _407 = precise::clamp(_405, 0.0, 1.0);
    out.m_54.x = _401;
    out.m_54.y = _393;
    out.m_54.z = _403;
    out.m_54.w = _407;
    return out;
}

