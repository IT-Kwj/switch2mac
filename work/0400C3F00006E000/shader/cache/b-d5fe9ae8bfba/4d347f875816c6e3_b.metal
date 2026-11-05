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
    texture2d<float> fp_t_tcb_A [[id(3)]];
    sampler fp_t_tcb_ASmplr [[id(4)]];
    texture2d<float> fp_t_tcb_8 [[id(5)]];
    sampler fp_t_tcb_8Smplr [[id(6)]];
    texture2d<float> fp_t_tcb_10 [[id(7)]];
    sampler fp_t_tcb_10Smplr [[id(8)]];
    sampler fp_t_tcb_ASmplr_w [[id(9)]];
    sampler fp_t_tcb_8Smplr_w [[id(10)]];
    sampler fp_t_tcb_10Smplr_w [[id(11)]];
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
    float4 m_39 [[user(locn2)]];
    float4 m_43 [[user(locn3)]];
    float4 m_37 [[user(locn4)]];
    float4 m_50 [[user(locn6)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _57 = gl_FragCoord.w;
    float _59 = in.m_37.z;
    float _61 = gl_FragCoord.w;
    float _63 = _59 * _61;
    float _65 = in.m_37.w;
    float _67 = gl_FragCoord.w;
    float _69 = _65 * _67;
    float _71 = in.m_37.x;
    float _73 = gl_FragCoord.w;
    float _75 = _71 * _73;
    float _77 = in.m_37.y;
    float _79 = gl_FragCoord.w;
    float _81 = _77 * _79;
    float _83 = 1.0 / _57;
    float _85 = _83 * _63;
    float _87 = _83 * _69;
    float _89 = _83 * _75;
    float _91 = _83 * _81;
    float2 _444 = float2(_85, _87);
    float _93 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_444, float2(0.0), isnan(_444))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_444, float2(0.0), isnan(_444))).w;
    float2 _455 = float2(_89, _91);
    float3 _97 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_455, float2(0.0), isnan(_455))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_455, float2(0.0), isnan(_455))).xyw;
    float _99 = _97.x;
    float _101 = _97.y;
    float _103 = _97.z;
    float _105 = in.m_39.w;
    float _107 = gl_FragCoord.w;
    float _109 = _105 * _107;
    float _111 = in.m_39.x;
    float _113 = gl_FragCoord.w;
    float _115 = _111 * _113;
    float _117 = in.m_39.y;
    float _119 = gl_FragCoord.w;
    float _121 = _117 * _119;
    float _123 = _83 * _109;
    float _125 = _83 * _115;
    float _127 = _83 * _121;
    float _129 = 1.0 / _123;
    float _131 = _125 * _129;
    float _133 = _127 * _129;
    float _135 = -_93;
    float _137 = _135 + 1.0;
    float _139 = fma(_99, 2.0, -1.0);
    float _141 = _137 * (*spvDescriptorSet0.fp_c9)._m0[191].x;
    float _143 = fma(_101, 2.0, -1.0);
    float _145 = fma(_139, _141, _85);
    float _147 = fma(_143, _141, _87);
    float2 _532 = float2(_131, _133);
    float _149 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_532, float2(0.0), isnan(_532))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_532, float2(0.0), isnan(_532))).x;
    float2 _540 = float2(_145, _147);
    float _151 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_540, float2(0.0), isnan(_540))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_540, float2(0.0), isnan(_540))).w;
    float _153 = in.m_39.z;
    float _155 = gl_FragCoord.w;
    float _157 = _153 * _155;
    float _159 = in.m_41.w;
    float _161 = gl_FragCoord.w;
    float _163 = _159 * _161;
    float _165 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[142].y;
    float _167 = _83 * _157;
    float _169 = _167 * _129;
    float _171 = _83 * _163;
    float _173 = in.m_43.x;
    float _175 = gl_FragCoord.w;
    float _177 = _173 * _175;
    float _179 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _181 = fma(_169, (*spvDescriptorSet0.fp_c8)._m0[30].w, _179);
    float _183 = fma(_171, 2.0, -1.0);
    float _185 = _103 + _183;
    float _187 = 1.0 / _181;
    float _189 = precise::max(_185, 0.4000000059604644775390625);
    float _191 = precise::min(_189, 0.60000002384185791015625);
    float _193 = fma(_191, 4.999999523162841796875, -1.99999988079071044921875);
    float _195 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _197 = _187 * _195;
    float _199 = in.m_41.x;
    float _201 = gl_FragCoord.w;
    float _203 = _199 * _201;
    float _205 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _207 = fma(_149, (*spvDescriptorSet0.fp_c8)._m0[30].w, _205);
    float _209 = 1.0 / _207;
    float _211 = _151 * _193;
    float _213 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _215 = -_197;
    float _217 = fma(_209, _213, _215);
    float _219 = _83 * _177;
    float _221 = _217 * _165;
    float _223 = precise::clamp(_221, 0.0, 1.0);
    float _225 = 0.0 + _211;
    float _227 = precise::clamp(_225, 0.0, 1.0);
    float _229 = _227 * _223;
    float _231 = _229 * _219;
    bool _235 = _231 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _237 = isnan(_231);
    bool _239 = _235 || _237;
    bool _241 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _243 = _239 || _241;
    float _245 = in.m_45.x;
    float _247 = gl_FragCoord.w;
    float _249 = _245 * _247;
    float _251 = in.m_45.y;
    float _253 = gl_FragCoord.w;
    float _255 = _251 * _253;
    float _257 = in.m_41.y;
    float _259 = gl_FragCoord.w;
    float _261 = _257 * _259;
    float _263 = in.m_45.z;
    float _265 = gl_FragCoord.w;
    float _267 = _263 * _265;
    float _269 = in.m_41.z;
    float _271 = gl_FragCoord.w;
    float _273 = _269 * _271;
    float _275 = _197;
    if (!_243)
    {
        discard_fragment();
    }
    float _277 = _83 * _203;
    float _279 = _83 * _249;
    float _281 = _83 * _255;
    float _283 = _83 * _261;
    float _285 = _83 * _267;
    float _287 = _83 * _273;
    float _289 = -_279;
    float _291 = _289 + _277;
    float _293 = -_281;
    float _295 = _293 + _283;
    float _297 = -_285;
    float _299 = _297 + _287;
    float _301 = fma(_211, _291, _279);
    float _303 = fma(_211, _295, _281);
    float _305 = fma(_211, _299, _285);
    if (!_243)
    {
        out.m_48.x = _301;
        out.m_48.y = _303;
        out.m_48.z = _305;
        out.m_48.w = _211;
        return out;
    }
    float _307 = _303 * 0.715200006961822509765625;
    float _309 = in.m_50.w;
    float _311 = gl_FragCoord.w;
    float _313 = _309 * _311;
    float _315 = in.m_50.x;
    float _317 = gl_FragCoord.w;
    float _319 = _315 * _317;
    float _321 = in.m_50.y;
    float _323 = gl_FragCoord.w;
    float _325 = _321 * _323;
    float _327 = fma(_301, 0.2125999927520751953125, _307);
    float _329 = in.m_50.z;
    float _331 = gl_FragCoord.w;
    float _333 = _329 * _331;
    float _335 = fma(_305, 0.072200000286102294921875, _327);
    bool _337 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _339 = 1.0 / _335;
    float _341 = (*spvDescriptorSet0.fp_c15)._m0[2].y;
    if (_337)
    {
        float _343 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _345 = _197 + _343;
        _275 = _345;
    }
    float _347 = _275;
    float _349 = _339 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _351 = precise::clamp(_349, 0.0, 1.0);
    float _353 = fma(_351, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _355 = _83 * _313;
    if (_337)
    {
        float _357 = _347 * 8.0;
        float _359 = precise::clamp(_357, 0.0, 1.0);
        _341 = _359;
    }
    float _361 = _341;
    float _363 = _83 * _325;
    float _365 = _353 * _355;
    float _367 = 0.0 + _231;
    float _369 = precise::clamp(_367, 0.0, 1.0);
    float _371 = _83 * _319;
    float _373 = _83 * _333;
    float _375 = fma(_303, _365, _363);
    float _377 = _369;
    if (_337)
    {
        float _379 = _369 * _361;
        _377 = _379;
    }
    float _381 = _377;
    float _383 = fma(_301, _365, _371);
    float _385 = fma(_305, _365, _373);
    float _387 = 0.0 + _381;
    float _389 = precise::clamp(_387, 0.0, 1.0);
    out.m_48.x = _383;
    out.m_48.y = _375;
    out.m_48.z = _385;
    out.m_48.w = _389;
    return out;
}

