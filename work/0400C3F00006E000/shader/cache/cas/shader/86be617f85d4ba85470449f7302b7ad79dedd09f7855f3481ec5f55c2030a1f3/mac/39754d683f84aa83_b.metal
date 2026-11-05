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
    uint4 _m1[8];
    float4 _m2;
    float4 _m3;
    int _m4;
    float4 _m5[73];
    int4 _m6;
    int _m7;
};

struct _16
{
    float4 _m0[4096];
};

struct spvDescriptorSetBuffer0
{
    constant _10* support_buffer [[id(0)]];
    constant _16* fp_c9 [[id(1)]];
    constant _16* fp_c15 [[id(2)]];
    constant _16* fp_c8 [[id(3)]];
    texture2d<float> fp_t_tcb_8 [[id(4)]];
    sampler fp_t_tcb_8Smplr [[id(5)]];
    sampler fp_t_tcb_8Smplr_w [[id(6)]];
    constant dm_border_t* dm_border [[id(7)]];
};

struct main0_out
{
    float4 m_42 [[color(0)]];
};

struct main0_in
{
    float4 m_35 [[user(locn0)]];
    float4 m_37 [[user(locn1)]];
    float4 m_48 [[user(locn2)]];
    float4 m_39 [[user(locn3)]];
    float4 m_33 [[user(locn4)]];
    float4 m_44 [[user(locn6)]];
    float4 m_46 [[user(locn7)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _55 = gl_FragCoord.w;
    float _57 = in.m_33.x;
    float _59 = gl_FragCoord.w;
    float _61 = _57 * _59;
    float _63 = in.m_33.y;
    float _65 = gl_FragCoord.w;
    float _67 = _63 * _65;
    float _69 = 1.0 / _55;
    float _71 = _69 * _61;
    float _73 = _69 * _67;
    float2 _379 = float2(_71, _73);
    float _75 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_379, float2(0.0), isnan(_379))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_379, float2(0.0), isnan(_379))).w;
    float _77 = in.m_35.w;
    float _79 = gl_FragCoord.w;
    float _81 = _77 * _79;
    float _83 = in.m_37.w;
    float _85 = gl_FragCoord.w;
    float _87 = _83 * _85;
    float _89 = in.m_39.x;
    float _91 = gl_FragCoord.w;
    float _93 = _89 * _91;
    float _95 = _69 * _81;
    float _97 = _69 * _87;
    float _99 = in.m_35.x;
    float _101 = gl_FragCoord.w;
    float _103 = _99 * _101;
    float _105 = -_95;
    float _107 = _75 + _105;
    float _109 = _69 * _93;
    float _111 = _97 * _107;
    float _113 = 0.0 + _111;
    float _115 = precise::clamp(_113, 0.0, 1.0);
    float _117 = _115 * _109;
    bool _121 = _117 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _123 = isnan(_117);
    bool _125 = _121 || _123;
    bool _127 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _129 = _125 || _127;
    float _131 = in.m_35.y;
    float _133 = gl_FragCoord.w;
    float _135 = _131 * _133;
    float _137 = in.m_35.z;
    float _139 = gl_FragCoord.w;
    float _141 = _137 * _139;
    if (!_129)
    {
        discard_fragment();
    }
    float _143 = _69 * _103;
    float _145 = _69 * _135;
    float _147 = _69 * _141;
    if (!_129)
    {
        out.m_42.x = _143;
        out.m_42.y = _145;
        out.m_42.z = _147;
        out.m_42.w = _111;
        return out;
    }
    float _149 = in.m_44.w;
    float _151 = gl_FragCoord.w;
    float _153 = _149 * _151;
    float _155 = _69 * _153;
    bool _157 = _155 != 1.0;
    bool _159 = isnan(_155);
    bool _161 = _157 || _159;
    bool _163 = isnan(1.0);
    bool _165 = _161 || _163;
    bool _167 = !_165;
    if (!_167)
    {
        float _169 = gl_FragCoord.x;
        float _171 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _173 = _169 / _171;
        float _175 = gl_FragCoord.y;
        float _177 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _179 = _175 / _177;
        float _181 = _155 * 256.0;
        float _183 = trunc(_181);
        int _186 = int(_183);
        uint _189 = uint(int(uint(_186) >> uint(7)));
        int _191 = int(_189) + _186;
        float _193 = trunc(_173);
        int _195 = int(_193);
        float _197 = trunc(_179);
        int _199 = int(_197);
        int _201 = _195 + 2;
        int _203 = _201 >> 1;
        uint _205 = uint(int(uint(_199) >> uint(1)));
        int _207 = _203 ^ int(_205);
        int _209 = _207 << 16;
        int _211 = _209 ^ _203;
        int _213 = 983055 & _211;
        int _215 = _213 << 6;
        int _217 = _215 + _213;
        int _219 = _217 & 13369548;
        uint _221 = uint(int(uint(_219) >> uint(3)));
        int _223 = _219 | int(_221);
        int _225 = _223 & 5570560;
        int _227 = _223 & 85;
        uint _229 = uint(int(uint(_225) >> uint(15)));
        int _231 = int(_229) + _227;
        bool _233 = uint(_191) > uint(_231);
        if (!_233)
        {
            discard_fragment();
        }
        if (!_233)
        {
            out.m_42.x = _143;
            out.m_42.y = _145;
            out.m_42.z = _147;
            out.m_42.w = _117;
            return out;
        }
    }
    float _235 = _145 * 0.715200006961822509765625;
    float _237 = in.m_46.w;
    float _239 = gl_FragCoord.w;
    float _241 = _237 * _239;
    float _243 = in.m_46.z;
    float _245 = gl_FragCoord.w;
    float _247 = _243 * _245;
    float _249 = in.m_46.x;
    float _251 = gl_FragCoord.w;
    float _253 = _249 * _251;
    float _255 = fma(_143, 0.2125999927520751953125, _235);
    float _257 = in.m_46.y;
    float _259 = gl_FragCoord.w;
    float _261 = _257 * _259;
    float _263 = fma(_147, 0.072200000286102294921875, _255);
    bool _265 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _267 = 1.0 / _263;
    float _269 = _267 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _271 = precise::clamp(_269, 0.0, 1.0);
    float _273 = fma(_271, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _275 = _69 * _241;
    float _277 = 0.0 + _117;
    float _279 = precise::clamp(_277, 0.0, 1.0);
    float _281 = _69 * _247;
    float _283 = _69 * _261;
    float _285 = _273 * _275;
    float _287 = _69 * _253;
    float _289 = fma(_147, _285, _281);
    float _291 = fma(_143, _285, _287);
    float _293 = fma(_145, _285, _283);
    float _295 = _281;
    if (!_265)
    {
        _295 = _279;
    }
    float _297 = _295;
    bool _299 = !_265;
    float _301 = _297;
    if (!_299)
    {
        float _303 = in.m_48.w;
        float _305 = gl_FragCoord.w;
        float _307 = _303 * _305;
        float _309 = in.m_48.z;
        float _311 = gl_FragCoord.w;
        float _313 = _309 * _311;
        float _315 = _69 * _307;
        float _317 = _69 * _313;
        float _319 = 1.0 / _315;
        float _321 = _317 * _319;
        float _323 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _325 = fma(_321, (*spvDescriptorSet0.fp_c8)._m0[30].w, _323);
        float _327 = 1.0 / _325;
        float _329 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _331 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _333 = fma(_327, _329, _331);
        float _335 = _333 * 8.0;
        float _337 = precise::clamp(_335, 0.0, 1.0);
        float _339 = _279 * _337;
        _301 = _339;
    }
    float _341 = _301;
    float _343 = 0.0 + _341;
    float _345 = precise::clamp(_343, 0.0, 1.0);
    out.m_42.x = _291;
    out.m_42.y = _293;
    out.m_42.z = _289;
    out.m_42.w = _345;
    return out;
}

