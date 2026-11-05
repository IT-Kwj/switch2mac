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
    texture2d<float> fp_t_tcb_A [[id(3)]];
    sampler fp_t_tcb_ASmplr [[id(4)]];
    texture2d<float> fp_t_tcb_C [[id(5)]];
    sampler fp_t_tcb_CSmplr [[id(6)]];
    texture2d<float> fp_t_tcb_8 [[id(7)]];
    sampler fp_t_tcb_8Smplr [[id(8)]];
    sampler fp_t_tcb_ASmplr_w [[id(9)]];
    sampler fp_t_tcb_CSmplr_w [[id(10)]];
    sampler fp_t_tcb_8Smplr_w [[id(11)]];
    constant dm_border_t* dm_border [[id(12)]];
};

struct main0_out
{
    float4 m_50 [[color(0)]];
};

struct main0_in
{
    float4 m_41 [[user(locn0)]];
    float4 m_43 [[user(locn1)]];
    float4 m_37 [[user(locn2)]];
    float4 m_54 [[user(locn3)]];
    float4 m_47 [[user(locn4)]];
    float4 m_45 [[user(locn5)]];
    float4 m_39 [[user(locn6)]];
    float4 m_52 [[user(locn8)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _61 = gl_FragCoord.w;
    float _63 = in.m_37.z;
    float _65 = gl_FragCoord.w;
    float _67 = _63 * _65;
    float _69 = in.m_39.y;
    float _71 = gl_FragCoord.w;
    float _73 = _69 * _71;
    float _75 = in.m_37.w;
    float _77 = gl_FragCoord.w;
    float _79 = _75 * _77;
    float _81 = in.m_39.x;
    float _83 = gl_FragCoord.w;
    float _85 = _81 * _83;
    float _87 = in.m_37.x;
    float _89 = gl_FragCoord.w;
    float _91 = _87 * _89;
    float _93 = in.m_37.y;
    float _95 = gl_FragCoord.w;
    float _97 = _93 * _95;
    float _99 = 1.0 / _61;
    float _101 = _99 * _67;
    float _103 = _99 * _73;
    float _105 = _99 * _79;
    float _107 = _99 * _85;
    float _109 = _99 * _91;
    float _111 = _99 * _97;
    float2 _444 = float2(_101, _105);
    float _113 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_444, float2(0.0), isnan(_444))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_444, float2(0.0), isnan(_444))).w;
    float2 _455 = float2(_107, _103);
    float _115 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_455, float2(0.0), isnan(_455))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_455, float2(0.0), isnan(_455))).w;
    float2 _463 = float2(_109, _111);
    float _117 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_463, float2(0.0), isnan(_463))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_463, float2(0.0), isnan(_463))).w;
    float _119 = in.m_41.w;
    float _121 = gl_FragCoord.w;
    float _123 = _119 * _121;
    float _125 = in.m_43.w;
    float _127 = gl_FragCoord.w;
    float _129 = _125 * _127;
    float _131 = in.m_45.w;
    float _133 = gl_FragCoord.w;
    float _135 = _131 * _133;
    float _137 = in.m_47.x;
    float _139 = gl_FragCoord.w;
    float _141 = _137 * _139;
    float _143 = _99 * _123;
    float _145 = in.m_43.x;
    float _147 = gl_FragCoord.w;
    float _149 = _145 * _147;
    float _151 = precise::max(_111, 0.20000000298023223876953125);
    float _153 = precise::min(_151, 0.699999988079071044921875);
    float _155 = _113 * _115;
    float _157 = -_143;
    float _159 = fma(_155, _117, _157);
    float _161 = _99 * _129;
    float _163 = _99 * _135;
    float _165 = _161 * _159;
    float _167 = precise::clamp(_165, 0.0, 1.0);
    float _169 = _167 * _163;
    float _171 = _99 * _141;
    float _173 = 0.0 + _169;
    float _175 = precise::clamp(_173, 0.0, 1.0);
    float _177 = _175 * _171;
    bool _181 = _177 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _183 = isnan(_177);
    bool _185 = _181 || _183;
    bool _187 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _189 = _185 || _187;
    float _191 = in.m_41.x;
    float _193 = gl_FragCoord.w;
    float _195 = _191 * _193;
    if (!_189)
    {
        discard_fragment();
    }
    float _197 = _99 * _195;
    float _199 = _99 * _149;
    float _201 = fma(_153, 2.0, -0.4000000059604644775390625);
    float _203 = in.m_43.y;
    float _205 = gl_FragCoord.w;
    float _207 = _203 * _205;
    float _209 = -_197;
    float _211 = _209 + _199;
    float _213 = fma(_201, _211, _197);
    float _215 = in.m_41.y;
    float _217 = gl_FragCoord.w;
    float _219 = _215 * _217;
    float _221 = _99 * _219;
    float _223 = _99 * _207;
    float _225 = in.m_43.z;
    float _227 = gl_FragCoord.w;
    float _229 = _225 * _227;
    float _231 = -_221;
    float _233 = _231 + _223;
    float _235 = fma(_201, _233, _221);
    float _237 = in.m_41.z;
    float _239 = gl_FragCoord.w;
    float _241 = _237 * _239;
    float _243 = _99 * _241;
    float _245 = _99 * _229;
    float _247 = -_243;
    float _249 = _247 + _245;
    float _251 = fma(_201, _249, _243);
    float _253 = _213 + 0.0500000007450580596923828125;
    float _255 = _235 + 0.0500000007450580596923828125;
    float _257 = _251 + 0.0500000007450580596923828125;
    if (!_189)
    {
        out.m_50.x = _253;
        out.m_50.y = _255;
        out.m_50.z = _257;
        out.m_50.w = _169;
        return out;
    }
    float _259 = in.m_52.w;
    float _261 = gl_FragCoord.w;
    float _263 = _259 * _261;
    float _265 = in.m_52.z;
    float _267 = gl_FragCoord.w;
    float _269 = _265 * _267;
    float _271 = in.m_52.x;
    float _273 = gl_FragCoord.w;
    float _275 = _271 * _273;
    float _277 = in.m_52.y;
    float _279 = gl_FragCoord.w;
    float _281 = _277 * _279;
    float _283 = fma(_235, 0.715200006961822509765625, 0.03576000034809112548828125);
    float _285 = fma(_253, 0.2125999927520751953125, _283);
    bool _287 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _289 = fma(_257, 0.072200000286102294921875, _285);
    float _291 = 1.0 / _289;
    float _293 = _99 * _263;
    float _295 = _291 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _297 = precise::clamp(_295, 0.0, 1.0);
    float _299 = _99 * _269;
    float _301 = fma(_297, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _303 = _301 * _293;
    float _305 = 0.0 + _177;
    float _307 = precise::clamp(_305, 0.0, 1.0);
    float _309 = _99 * _275;
    float _311 = _99 * _281;
    float _313 = fma(_257, _303, _299);
    float _315 = fma(_253, _303, _309);
    float _317 = fma(_255, _303, _311);
    float _319 = _299;
    if (!_287)
    {
        _319 = _307;
    }
    float _321 = _319;
    bool _323 = !_287;
    float _325 = _321;
    if (!_323)
    {
        float _327 = in.m_54.w;
        float _329 = gl_FragCoord.w;
        float _331 = _327 * _329;
        float _333 = in.m_54.z;
        float _335 = gl_FragCoord.w;
        float _337 = _333 * _335;
        float _339 = _99 * _331;
        float _341 = _99 * _337;
        float _343 = 1.0 / _339;
        float _345 = _341 * _343;
        float _347 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _349 = fma(_345, (*spvDescriptorSet0.fp_c8)._m0[30].w, _347);
        float _351 = 1.0 / _349;
        float _353 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _355 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _357 = fma(_351, _353, _355);
        float _359 = _357 * 8.0;
        float _361 = precise::clamp(_359, 0.0, 1.0);
        float _363 = _307 * _361;
        _325 = _363;
    }
    float _365 = _325;
    float _367 = 0.0 + _365;
    float _369 = precise::clamp(_367, 0.0, 1.0);
    out.m_50.x = _315;
    out.m_50.y = _317;
    out.m_50.z = _313;
    out.m_50.w = _369;
    return out;
}

