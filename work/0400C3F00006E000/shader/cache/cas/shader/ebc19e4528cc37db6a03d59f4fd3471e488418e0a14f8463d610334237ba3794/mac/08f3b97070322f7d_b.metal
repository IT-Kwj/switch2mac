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
    texture2d_array<float> fp_t_tcb_C [[id(5)]];
    sampler fp_t_tcb_CSmplr [[id(6)]];
    texture2d<float> fp_t_tcb_A [[id(7)]];
    sampler fp_t_tcb_ASmplr [[id(8)]];
    sampler fp_t_tcb_8Smplr_w [[id(9)]];
    sampler fp_t_tcb_CSmplr_w [[id(10)]];
    sampler fp_t_tcb_ASmplr_w [[id(11)]];
    constant dm_border_t* dm_border [[id(12)]];
};

struct main0_out
{
    float4 m_59 [[color(0)]];
};

struct main0_in
{
    float4 m_52 [[user(locn0)]];
    float4 m_54 [[user(locn1)]];
    float4 m_50 [[user(locn2)]];
    float4 m_46 [[user(locn3), flat]];
    float4 m_42 [[user(locn4)]];
    float4 m_61 [[user(locn5)]];
    float4 m_56 [[user(locn6)]];
    float4 m_48 [[user(locn7), flat]];
    float4 m_44 [[user(locn8)]];
    float4 m_38 [[user(locn9), flat]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _68 = in.m_38.z;
    float _70 = gl_FragCoord.w;
    float _72 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[40].x;
    float _74 = in.m_42.x;
    float _76 = gl_FragCoord.w;
    float _78 = _74 * _76;
    float _80 = in.m_42.y;
    float _82 = gl_FragCoord.w;
    float _84 = _80 * _82;
    float _86 = in.m_44.x;
    float _88 = gl_FragCoord.w;
    float _90 = _86 * _88;
    float _92 = in.m_44.y;
    float _94 = gl_FragCoord.w;
    float _96 = _92 * _94;
    float _98 = _68 + 1.0;
    float _100 = 1.0 / _70;
    float _102 = _98 * _72;
    float _104 = floor(_102);
    float _106 = rint(_68);
    float _108 = precise::max(_106, 0.0);
    uint _111 = uint(_108);
    uint _113 = clamp(_111, 0u, 65535u);
    float _115 = _100 * _90;
    float _117 = -_104;
    float _119 = fma(_117, (*spvDescriptorSet0.fp_c9)._m0[40].x, _98);
    float _121 = _100 * _78;
    float _123 = _100 * _84;
    float _125 = _100 * _96;
    float _127 = rint(_119);
    float _129 = precise::max(_127, 0.0);
    uint _131 = uint(_129);
    uint _133 = clamp(_131, 0u, 65535u);
    float2 _486 = float2(_121, _123);
    float2 _137 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_486, float2(0.0), isnan(_486))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_486, float2(0.0), isnan(_486))).xy;
    float _139 = _137.x;
    float _141 = _137.y;
    float3 _504 = float3(_115, _125, float(int(_113)));
    float3 _508 = select(_504, float3(0.0), isnan(_504));
    float _143 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, _508.xy, uint(rint(_508.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, _508.xy, uint(rint(_508.z))).w;
    float3 _517 = float3(_115, _125, float(int(_133)));
    float3 _519 = select(_517, float3(0.0), isnan(_517));
    float _145 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, _519.xy, uint(rint(_519.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, _519.xy, uint(rint(_519.z))).w;
    float _147 = in.m_46.x;
    float _149 = in.m_42.z;
    float _151 = gl_FragCoord.w;
    float _153 = _149 * _151;
    float _155 = in.m_42.w;
    float _157 = gl_FragCoord.w;
    float _159 = _155 * _157;
    float _161 = _147 * (*spvDescriptorSet0.fp_c9)._m0[21].x;
    float _163 = _100 * _153;
    float _165 = _147 * (*spvDescriptorSet0.fp_c9)._m0[21].y;
    float _167 = _100 * _159;
    float _169 = fma(_165, _141, _167);
    float _171 = fma(_161, _139, _163);
    float2 _564 = float2(_171, _169);
    float _173 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_564, float2(0.0), isnan(_564))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_564, float2(0.0), isnan(_564))).w;
    float _175 = in.m_48.y;
    float _177 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[40].y;
    float _179 = in.m_50.w;
    float _181 = gl_FragCoord.w;
    float _183 = _179 * _181;
    float _185 = in.m_52.w;
    float _187 = gl_FragCoord.w;
    float _189 = _185 * _187;
    float _191 = in.m_54.w;
    float _193 = gl_FragCoord.w;
    float _195 = _191 * _193;
    float _197 = in.m_56.x;
    float _199 = gl_FragCoord.w;
    float _201 = _197 * _199;
    float _203 = -_143;
    float _205 = _203 + _145;
    float _207 = _175 * _177;
    float _209 = _207 * _177;
    float _211 = floor(_209);
    float _213 = -_211;
    float _215 = fma(_213, (*spvDescriptorSet0.fp_c9)._m0[40].y, _207);
    float _217 = _100 * _183;
    float _219 = _100 * _195;
    float _221 = _215 + 9.9999997473787516355514526367188e-05;
    float _223 = floor(_221);
    float _225 = -_223;
    float _227 = _221 + _225;
    float _229 = fma(_227, _205, _143);
    float _231 = _173 * _229;
    float _233 = _231 * _217;
    float _235 = _100 * _189;
    float _237 = _235 * _233;
    float _239 = _100 * _201;
    float _241 = _219 * _237;
    float _243 = 0.0 + _241;
    float _245 = precise::clamp(_243, 0.0, 1.0);
    float _247 = _245 * _239;
    bool _251 = _247 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _253 = isnan(_247);
    bool _255 = _251 || _253;
    bool _257 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _259 = _255 || _257;
    float _261 = in.m_52.x;
    float _263 = gl_FragCoord.w;
    float _265 = _261 * _263;
    float _267 = in.m_50.x;
    float _269 = gl_FragCoord.w;
    float _271 = _267 * _269;
    if (!_259)
    {
        discard_fragment();
    }
    float _273 = in.m_50.z;
    float _275 = gl_FragCoord.w;
    float _277 = _273 * _275;
    float _279 = _100 * _265;
    float _281 = _100 * _271;
    float _283 = in.m_50.y;
    float _285 = gl_FragCoord.w;
    float _287 = _283 * _285;
    float _289 = _279 * _281;
    float _291 = in.m_52.y;
    float _293 = gl_FragCoord.w;
    float _295 = _291 * _293;
    float _297 = _100 * _287;
    float _299 = in.m_52.z;
    float _301 = gl_FragCoord.w;
    float _303 = _299 * _301;
    float _305 = _100 * _295;
    float _307 = _305 * _297;
    float _309 = _100 * _303;
    float _311 = _100 * _277;
    float _313 = _309 * _311;
    if (!_259)
    {
        out.m_59.x = _289;
        out.m_59.y = _307;
        out.m_59.z = _313;
        out.m_59.w = _241;
        return out;
    }
    float _315 = _307 * 0.715200006961822509765625;
    float _317 = 0.0 + _247;
    float _319 = precise::clamp(_317, 0.0, 1.0);
    float _321 = fma(_289, 0.2125999927520751953125, _315);
    bool _323 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _325 = fma(_313, 0.072200000286102294921875, _321);
    float _327 = 1.0 / _325;
    float _329 = _327 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _331 = precise::clamp(_329, 0.0, 1.0);
    float _333 = fma(_331, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _335 = _289 * _333;
    float _337 = _307 * _333;
    float _339 = _313 * _333;
    float _341 = _333;
    if (!_323)
    {
        _341 = _319;
    }
    float _343 = _341;
    bool _345 = !_323;
    float _347 = _343;
    if (!_345)
    {
        float _349 = in.m_61.w;
        float _351 = gl_FragCoord.w;
        float _353 = _349 * _351;
        float _355 = in.m_61.z;
        float _357 = gl_FragCoord.w;
        float _359 = _355 * _357;
        float _361 = _100 * _353;
        float _363 = _100 * _359;
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
        float _385 = _319 * _383;
        _347 = _385;
    }
    float _387 = _347;
    float _389 = 0.0 + _387;
    float _391 = precise::clamp(_389, 0.0, 1.0);
    out.m_59.x = _335;
    out.m_59.y = _337;
    out.m_59.z = _339;
    out.m_59.w = _391;
    return out;
}

