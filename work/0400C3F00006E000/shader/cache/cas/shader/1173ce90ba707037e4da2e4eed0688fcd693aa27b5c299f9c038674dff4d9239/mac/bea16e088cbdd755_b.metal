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
    texture2d<float> fp_t_tcb_8 [[id(3)]];
    sampler fp_t_tcb_8Smplr [[id(4)]];
    sampler fp_t_tcb_8Smplr_w [[id(5)]];
    constant dm_border_t* dm_border [[id(6)]];
};

struct main0_out
{
    float4 m_42 [[color(0)]];
};

struct main0_in
{
    float4 m_31 [[user(locn0)]];
    float4 m_39 [[user(locn1)]];
    float4 m_37 [[user(locn2)]];
    float4 m_35 [[user(locn3)]];
    float4 m_33 [[user(locn4)]];
    float4 m_44 [[user(locn7)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _51 = gl_FragCoord.w;
    float _53 = in.m_31.w;
    float _55 = gl_FragCoord.w;
    float _57 = _53 * _55;
    float _59 = in.m_33.w;
    float _61 = gl_FragCoord.w;
    float _63 = _59 * _61;
    float _65 = in.m_35.x;
    float _67 = gl_FragCoord.w;
    float _69 = _65 * _67;
    float _71 = 1.0 / _51;
    float _73 = _71 * _57;
    float _75 = _71 * _63;
    float _77 = _71 * _69;
    float _79 = _73 * _75;
    float _81 = 0.0 + _79;
    float _83 = precise::clamp(_81, 0.0, 1.0);
    float _85 = _83 * _77;
    bool _89 = _85 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _91 = isnan(_85);
    bool _93 = _89 || _91;
    bool _95 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _97 = _93 || _95;
    float _99 = in.m_37.x;
    float _101 = gl_FragCoord.w;
    float _103 = _99 * _101;
    float _105 = in.m_37.y;
    float _107 = gl_FragCoord.w;
    float _109 = _105 * _107;
    if (!_97)
    {
        discard_fragment();
    }
    float _111 = _71 * _103;
    float _113 = _71 * _109;
    float2 _403 = float2(_111, _113);
    float3 _117 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_403, float2(0.0), isnan(_403))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_403, float2(0.0), isnan(_403))).xyz;
    float _119 = _117.x;
    float _121 = _117.y;
    float _123 = _117.z;
    float _125 = in.m_39.x;
    float _127 = gl_FragCoord.w;
    float _129 = _125 * _127;
    float _131 = in.m_31.y;
    float _133 = gl_FragCoord.w;
    float _135 = _131 * _133;
    float _137 = in.m_31.x;
    float _139 = gl_FragCoord.w;
    float _141 = _137 * _139;
    float _143 = in.m_39.y;
    float _145 = gl_FragCoord.w;
    float _147 = _143 * _145;
    float _149 = in.m_31.z;
    float _151 = gl_FragCoord.w;
    float _153 = _149 * _151;
    float _155 = in.m_39.z;
    float _157 = gl_FragCoord.w;
    float _159 = _155 * _157;
    float _161 = _71 * _129;
    float _163 = _71 * _135;
    float _165 = _71 * _141;
    float _167 = _71 * _147;
    float _169 = _71 * _153;
    float _171 = _71 * _159;
    float _173 = -_161;
    float _175 = _165 + _173;
    float _177 = -_167;
    float _179 = _163 + _177;
    float _181 = -_171;
    float _183 = _169 + _181;
    float _185 = _119 * _119;
    float _187 = _121 * _121;
    float _189 = _123 * _123;
    float _191 = fma(_185, _175, _161);
    float _193 = fma(_187, _179, _167);
    float _195 = fma(_189, _183, _171);
    if (!_97)
    {
        out.m_42.x = _191;
        out.m_42.y = _193;
        out.m_42.z = _195;
        out.m_42.w = _79;
        return out;
    }
    float _197 = in.m_44.w;
    float _199 = gl_FragCoord.w;
    float _201 = _197 * _199;
    float _203 = _71 * _201;
    bool _205 = _203 != 1.0;
    bool _207 = isnan(_203);
    bool _209 = _205 || _207;
    bool _211 = isnan(1.0);
    bool _213 = _209 || _211;
    bool _215 = !_213;
    if (!_215)
    {
        float _217 = gl_FragCoord.x;
        float _219 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _221 = _217 / _219;
        float _223 = gl_FragCoord.y;
        float _225 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _227 = _223 / _225;
        float _229 = _203 * 256.0;
        float _231 = trunc(_229);
        int _234 = int(_231);
        float _236 = trunc(_221);
        int _238 = int(_236);
        float _240 = trunc(_227);
        int _242 = int(_240);
        int _244 = _238 + 2;
        int _246 = _244 >> 1;
        uint _249 = uint(int(uint(_242) >> uint(1)));
        int _251 = _246 ^ int(_249);
        int _253 = _251 << 16;
        int _255 = _253 ^ _246;
        int _257 = 983055 & _255;
        int _259 = _257 << 6;
        int _261 = _259 + _257;
        int _263 = _261 & 13369548;
        uint _265 = uint(int(uint(_263) >> uint(3)));
        int _267 = _263 | int(_265);
        uint _269 = uint(int(uint(_234) >> uint(7)));
        int _271 = int(_269) + _234;
        int _273 = _267 & 5570560;
        int _275 = _267 & 85;
        uint _277 = uint(int(uint(_273) >> uint(15)));
        int _279 = int(_277) + _275;
        bool _281 = uint(_271) > uint(_279);
        if (!_281)
        {
            discard_fragment();
        }
        if (!_281)
        {
            out.m_42.x = _191;
            out.m_42.y = _193;
            out.m_42.z = _195;
            out.m_42.w = _85;
            return out;
        }
    }
    float _283 = _193 * 0.715200006961822509765625;
    float _285 = fma(_191, 0.2125999927520751953125, _283);
    float _287 = fma(_195, 0.072200000286102294921875, _285);
    float _289 = 1.0 / _287;
    float _291 = _289 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _293 = precise::clamp(_291, 0.0, 1.0);
    float _295 = fma(_293, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _297 = _191 * _295;
    float _299 = _193 * _295;
    float _301 = _195 * _295;
    float _303 = 0.0 + _85;
    float _305 = precise::clamp(_303, 0.0, 1.0);
    out.m_42.x = _297;
    out.m_42.y = _299;
    out.m_42.z = _301;
    out.m_42.w = _305;
    return out;
}

