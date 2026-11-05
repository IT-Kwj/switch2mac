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
    texture2d<float> fp_t_tcb_A [[id(5)]];
    sampler fp_t_tcb_ASmplr [[id(6)]];
    texture2d<float> fp_t_tcb_E [[id(7)]];
    sampler fp_t_tcb_ESmplr [[id(8)]];
    sampler fp_t_tcb_8Smplr_w [[id(9)]];
    sampler fp_t_tcb_ASmplr_w [[id(10)]];
    sampler fp_t_tcb_ESmplr_w [[id(11)]];
    constant dm_border_t* dm_border [[id(12)]];
};

struct main0_out
{
    float4 m_50 [[color(0)]];
};

struct main0_in
{
    float4 m_37 [[user(locn0)]];
    float4 m_45 [[user(locn1)]];
    float4 m_39 [[user(locn2)]];
    float4 m_47 [[user(locn3)]];
    float4 m_41 [[user(locn4)]];
    float4 m_43 [[user(locn5)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _57 = gl_FragCoord.w;
    float _59 = in.m_37.x;
    float _61 = gl_FragCoord.w;
    float _63 = _59 * _61;
    float _65 = 1.0 / _57;
    float _67 = _65 * _63;
    bool _71 = _67 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _73 = isnan(_67);
    bool _75 = _71 || _73;
    bool _77 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _79 = _75 || _77;
    float _81 = in.m_39.x;
    float _83 = gl_FragCoord.w;
    float _85 = _81 * _83;
    float _87 = in.m_39.y;
    float _89 = gl_FragCoord.w;
    float _91 = _87 * _89;
    float _93 = in.m_39.z;
    float _95 = gl_FragCoord.w;
    float _97 = _93 * _95;
    float _99 = in.m_39.w;
    float _101 = gl_FragCoord.w;
    float _103 = _99 * _101;
    if (!_79)
    {
        discard_fragment();
    }
    float _105 = _65 * _85;
    float _107 = _65 * _91;
    float _109 = _65 * _97;
    float _111 = _65 * _103;
    float2 _459 = float2(_105, _107);
    float _113 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_459, float2(0.0), isnan(_459))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_459, float2(0.0), isnan(_459))).w;
    float2 _470 = float2(_109, _111);
    float _115 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_470, float2(0.0), isnan(_470))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_470, float2(0.0), isnan(_470))).w;
    float _117 = in.m_41.y;
    float _119 = gl_FragCoord.w;
    float _121 = _117 * _119;
    float _123 = in.m_43.y;
    float _125 = gl_FragCoord.w;
    float _127 = _123 * _125;
    float _129 = in.m_43.x;
    float _131 = gl_FragCoord.w;
    float _133 = _129 * _131;
    float _135 = in.m_43.z;
    float _137 = gl_FragCoord.w;
    float _139 = _135 * _137;
    float _141 = in.m_41.x;
    float _143 = gl_FragCoord.w;
    float _145 = _141 * _143;
    float _147 = in.m_41.z;
    float _149 = gl_FragCoord.w;
    float _151 = _147 * _149;
    float _153 = in.m_45.w;
    float _155 = gl_FragCoord.w;
    float _157 = _153 * _155;
    float _159 = _65 * _121;
    float _161 = _65 * _127;
    float _163 = _65 * _133;
    float _165 = _65 * _139;
    float _167 = _65 * _145;
    float _169 = _159 * _159;
    float _171 = -(*spvDescriptorSet0.fp_c8)._m0[29].y;
    float _173 = _161 + _171;
    float _175 = -(*spvDescriptorSet0.fp_c8)._m0[29].x;
    float _177 = _163 + _175;
    float _179 = -(*spvDescriptorSet0.fp_c8)._m0[29].z;
    float _181 = _165 + _179;
    float _183 = fma(_167, _167, _169);
    float _185 = _173 * _173;
    float _187 = _65 * _151;
    float _189 = fma(_177, _177, _185);
    float _191 = fma(_187, _187, _183);
    float _193 = fma(_181, _181, _189);
    float _195 = rsqrt(_191);
    float _197 = rsqrt(_193);
    float _199 = _159 * _195;
    float _201 = _167 * _195;
    float _203 = _187 * _195;
    float _205 = _161 * (*spvDescriptorSet0.fp_c8)._m0[2].y;
    float _207 = _199 * _199;
    float _209 = fma(_163, (*spvDescriptorSet0.fp_c8)._m0[2].x, _205);
    float _211 = _173 * _197;
    float _213 = _177 * _197;
    float _215 = _181 * _197;
    float _217 = fma(_201, _201, _207);
    float _219 = _211 * _211;
    float _221 = fma(_165, (*spvDescriptorSet0.fp_c8)._m0[2].z, _209);
    float _223 = fma(_203, _203, _217);
    float _225 = fma(_213, _213, _219);
    float _227 = fma(_215, _215, _225);
    float _229 = rsqrt(_223);
    float _231 = rsqrt(_227);
    float _233 = _199 * _229;
    float _235 = _201 * _229;
    float _237 = _203 * _229;
    float _239 = _211 * _231;
    float _241 = _213 * _231;
    float _243 = in.m_47.w;
    float _245 = gl_FragCoord.w;
    float _247 = _243 * _245;
    float _249 = _215 * _231;
    float _251 = _233 * _239;
    float _253 = _221 + (*spvDescriptorSet0.fp_c8)._m0[2].w;
    float _255 = _65 * _157;
    float _257 = fma(_235, _241, _251);
    float _259 = in.m_47.y;
    float _261 = gl_FragCoord.w;
    float _263 = _259 * _261;
    float _265 = -_253;
    float _267 = precise::max(_265, 15.0);
    float _269 = fma(_237, _249, _257);
    float _271 = in.m_47.x;
    float _273 = gl_FragCoord.w;
    float _275 = _271 * _273;
    float _277 = precise::min(_267, 35.0);
    float _279 = abs(_269);
    float _281 = fma(_279, 1.4285714626312255859375, -0.2857142984867095947265625);
    float _283 = precise::clamp(_281, 0.0, 1.0);
    float _285 = fma(_283, -2.0, 3.0);
    float _287 = _283 * _283;
    float _289 = _285 * _287;
    float _291 = fma(_277, -0.0500000007450580596923828125, 1.75);
    float _293 = _289 * _291;
    float _295 = _65 * _247;
    float _297 = 1.0 / _295;
    float _299 = _65 * _275;
    float _301 = _299 * _297;
    float _303 = _255 * _113;
    float _305 = _65 * _263;
    float _307 = _303 * _115;
    float _309 = precise::max(_307, 0.0500000007450580596923828125);
    float _311 = precise::min(_309, 0.980000019073486328125);
    float _313 = fma(_311, 1.07526886463165283203125, -0.0537634454667568206787109375);
    float _315 = _313 * _293;
    float _317 = _315 * (*spvDescriptorSet0.fp_c9)._m0[191].x;
    float _319 = fma(_305, _297, _317);
    float2 _781 = float2(_301, _319);
    float3 _323 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_781, float2(0.0), isnan(_781))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_781, float2(0.0), isnan(_781))).xyz;
    float _325 = _323.x;
    float _327 = _323.y;
    float _329 = _323.z;
    float _331 = in.m_47.z;
    float _333 = gl_FragCoord.w;
    float _335 = _331 * _333;
    float _337 = _65 * _335;
    if (!_79)
    {
        out.m_50.x = _325;
        out.m_50.y = _327;
        out.m_50.z = _329;
        out.m_50.w = 1.0;
        return out;
    }
    bool _339 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _341 = 0.0 + _67;
    float _343 = precise::clamp(_341, 0.0, 1.0);
    bool _345 = !_339;
    float _347 = _343;
    if (!_345)
    {
        float _349 = _337 * _297;
        float _351 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _353 = fma(_349, (*spvDescriptorSet0.fp_c8)._m0[30].w, _351);
        float _355 = 1.0 / _353;
        float _357 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _359 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _361 = fma(_355, _357, _359);
        float _363 = _361 * 8.0;
        float _365 = precise::clamp(_363, 0.0, 1.0);
        float _367 = _343 * _365;
        _347 = _367;
    }
    float _369 = _347;
    float _371 = 0.0 + _369;
    float _373 = precise::clamp(_371, 0.0, 1.0);
    out.m_50.x = _325;
    out.m_50.y = _327;
    out.m_50.z = _329;
    out.m_50.w = _373;
    return out;
}

