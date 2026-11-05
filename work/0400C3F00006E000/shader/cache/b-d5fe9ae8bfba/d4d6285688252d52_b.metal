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
    sampler fp_t_tcb_8Smplr_w [[id(7)]];
    sampler fp_t_tcb_ASmplr_w [[id(8)]];
    constant dm_border_t* dm_border [[id(9)]];
};

struct main0_out
{
    float4 m_46 [[color(0)]];
};

struct main0_in
{
    float4 m_43 [[user(locn0)]];
    float4 m_41 [[user(locn1)]];
    float4 m_50 [[user(locn2)]];
    float4 m_35 [[user(locn3)]];
    float4 m_37 [[user(locn4)]];
    float4 m_39 [[user(locn5)]];
    float4 m_48 [[user(locn6)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _57 = gl_FragCoord.w;
    float _59 = in.m_35.x;
    float _61 = gl_FragCoord.w;
    float _63 = _59 * _61;
    float _65 = 1.0 / _57;
    float _67 = _65 * _63;
    bool _71 = _67 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _73 = isnan(_67);
    bool _75 = _71 || _73;
    bool _77 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _79 = _75 || _77;
    float _81 = in.m_37.x;
    float _83 = gl_FragCoord.w;
    float _85 = _81 * _83;
    float _87 = in.m_37.y;
    float _89 = gl_FragCoord.w;
    float _91 = _87 * _89;
    if (!_79)
    {
        discard_fragment();
    }
    float _93 = in.m_37.z;
    float _95 = gl_FragCoord.w;
    float _97 = _93 * _95;
    float _99 = in.m_37.w;
    float _101 = gl_FragCoord.w;
    float _103 = _99 * _101;
    float _105 = _65 * _85;
    float _107 = _65 * _91;
    float2 _451 = float2(_105, _107);
    float3 _111 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_451, float2(0.0), isnan(_451))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_451, float2(0.0), isnan(_451))).xyz;
    float _113 = _111.x;
    float _115 = _111.y;
    float _117 = _111.z;
    float _119 = _65 * _97;
    float _121 = _65 * _103;
    float2 _474 = float2(_119, _121);
    float _123 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_474, float2(0.0), isnan(_474))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_474, float2(0.0), isnan(_474))).w;
    float _125 = in.m_39.y;
    float _127 = gl_FragCoord.w;
    float _129 = _125 * _127;
    float _131 = in.m_39.x;
    float _133 = gl_FragCoord.w;
    float _135 = _131 * _133;
    float _137 = in.m_39.z;
    float _139 = gl_FragCoord.w;
    float _141 = _137 * _139;
    float _143 = in.m_41.x;
    float _145 = gl_FragCoord.w;
    float _147 = _143 * _145;
    float _149 = in.m_43.y;
    float _151 = gl_FragCoord.w;
    float _153 = _149 * _151;
    float _155 = in.m_41.y;
    float _157 = gl_FragCoord.w;
    float _159 = _155 * _157;
    float _161 = in.m_43.z;
    float _163 = gl_FragCoord.w;
    float _165 = _161 * _163;
    float _167 = in.m_41.z;
    float _169 = gl_FragCoord.w;
    float _171 = _167 * _169;
    float _173 = _65 * _129;
    float _175 = _65 * _135;
    float _177 = _65 * _141;
    float _179 = _173 * _173;
    float _181 = _65 * _159;
    float _183 = _65 * _171;
    float _185 = fma(_175, _175, _179);
    float _187 = fma(_177, _177, _185);
    float _189 = rsqrt(_187);
    float _191 = _65 * _165;
    float _193 = _173 * _189;
    float _195 = _175 * _189;
    float _197 = _177 * _189;
    float _199 = _193 * _193;
    float _201 = fma(_195, _195, _199);
    float _203 = in.m_43.x;
    float _205 = gl_FragCoord.w;
    float _207 = _203 * _205;
    float _209 = fma(_197, _197, _201);
    float _211 = rsqrt(_209);
    float _213 = _197 * _211;
    float _215 = _193 * _211;
    float _217 = _213 * (-0.577381789684295654296875);
    float _219 = fma(_215, -0.816474258899688720703125, _217);
    float _221 = _65 * _207;
    float _223 = _65 * _147;
    float _225 = _65 * _153;
    float _227 = fma(_219, 0.5, 0.5);
    bool _229 = _227 >= 0.5;
    bool _231 = isnan(_227);
    bool _233 = _229 || _231;
    bool _235 = isnan(0.5);
    bool _237 = _233 || _235;
    float _239 = float(_237);
    float _241 = _113 * _113;
    float _243 = _115 * _115;
    float _245 = _117 * _117;
    float _247 = fma(_241, _221, _223);
    float _249 = fma(_243, _225, _181);
    float _251 = fma(_245, _191, _183);
    float _253 = _247 + _239;
    float _255 = _249 + _239;
    float _257 = _251 + _239;
    float _259 = _253 * _123;
    float _261 = _255 * _123;
    float _263 = _257 * _123;
    if (!_79)
    {
        out.m_46.x = _259;
        out.m_46.y = _261;
        out.m_46.z = _263;
        out.m_46.w = 1.0;
        return out;
    }
    float _265 = _261 * 0.715200006961822509765625;
    float _267 = in.m_48.w;
    float _269 = gl_FragCoord.w;
    float _271 = _267 * _269;
    float _273 = in.m_48.x;
    float _275 = gl_FragCoord.w;
    float _277 = _273 * _275;
    float _279 = in.m_48.y;
    float _281 = gl_FragCoord.w;
    float _283 = _279 * _281;
    float _285 = fma(_259, 0.2125999927520751953125, _265);
    float _287 = in.m_48.z;
    float _289 = gl_FragCoord.w;
    float _291 = _287 * _289;
    bool _293 = 0.5 <= (*spvDescriptorSet0.fp_c15)._m0[653].w;
    float _295 = fma(_263, 0.072200000286102294921875, _285);
    float _297 = 1.0 / _295;
    float _299 = _297 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _301 = precise::clamp(_299, 0.0, 1.0);
    float _303 = 0.0 + _67;
    float _305 = precise::clamp(_303, 0.0, 1.0);
    float _307 = _65 * _271;
    float _309 = fma(_301, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _311 = _65 * _277;
    float _313 = _309 * _307;
    float _315 = _65 * _283;
    float _317 = _65 * _291;
    float _319 = fma(_259, _313, _311);
    float _321 = fma(_261, _313, _315);
    float _323 = fma(_263, _313, _317);
    bool _325 = !_293;
    float _327 = _305;
    if (!_325)
    {
        float _329 = in.m_50.w;
        float _331 = gl_FragCoord.w;
        float _333 = _329 * _331;
        float _335 = in.m_50.z;
        float _337 = gl_FragCoord.w;
        float _339 = _335 * _337;
        float _341 = _65 * _333;
        float _343 = _65 * _339;
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
        float _365 = _305 * _363;
        _327 = _365;
    }
    float _367 = _327;
    float _369 = 0.0 + _367;
    float _371 = precise::clamp(_369, 0.0, 1.0);
    out.m_46.x = _319;
    out.m_46.y = _321;
    out.m_46.z = _323;
    out.m_46.w = _371;
    return out;
}

