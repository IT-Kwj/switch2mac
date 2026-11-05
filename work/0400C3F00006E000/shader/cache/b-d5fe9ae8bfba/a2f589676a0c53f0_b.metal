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
    constant _16* fp_c15 [[id(1)]];
    texture2d<float> fp_t_tcb_8 [[id(2)]];
    sampler fp_t_tcb_8Smplr [[id(3)]];
    sampler fp_t_tcb_8Smplr_w [[id(4)]];
    constant dm_border_t* dm_border [[id(5)]];
};

struct main0_out
{
    float4 m_40 [[color(0)]];
};

struct main0_in
{
    float4 m_35 [[user(locn0)]];
    float4 m_33 [[user(locn1)]];
    float4 m_29 [[user(locn2)]];
    float4 m_37 [[user(locn3)]];
    float4 m_31 [[user(locn5)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _47 = gl_FragCoord.w;
    float _49 = in.m_29.x;
    float _51 = gl_FragCoord.w;
    float _53 = _49 * _51;
    float _55 = in.m_29.y;
    float _57 = gl_FragCoord.w;
    float _59 = _55 * _57;
    float _61 = 1.0 / _47;
    float _63 = _61 * _53;
    float _65 = _61 * _59;
    float2 _283 = float2(_63, _65);
    float3 _69 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_283, float2(0.0), isnan(_283))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_283, float2(0.0), isnan(_283))).xyz;
    float _71 = _69.x;
    float _73 = _69.y;
    float _75 = _69.z;
    float _77 = in.m_31.w;
    float _79 = gl_FragCoord.w;
    float _81 = _77 * _79;
    float _83 = in.m_33.w;
    float _85 = gl_FragCoord.w;
    float _87 = _83 * _85;
    float _89 = in.m_35.w;
    float _91 = gl_FragCoord.w;
    float _93 = _89 * _91;
    float _95 = in.m_37.x;
    float _97 = gl_FragCoord.w;
    float _99 = _95 * _97;
    float _101 = in.m_35.x;
    float _103 = gl_FragCoord.w;
    float _105 = _101 * _103;
    float _107 = in.m_35.y;
    float _109 = gl_FragCoord.w;
    float _111 = _107 * _109;
    float _113 = in.m_35.z;
    float _115 = gl_FragCoord.w;
    float _117 = _113 * _115;
    float _119 = _61 * _81;
    float _121 = _61 * _87;
    float _123 = _61 * _93;
    float _125 = _61 * _99;
    float _127 = _61 * _105;
    bool _131 = _119 != 1.0;
    bool _133 = isnan(_119);
    bool _135 = _131 || _133;
    bool _137 = isnan(1.0);
    bool _139 = _135 || _137;
    float _141 = _121 * _121;
    float _143 = _61 * _111;
    float _145 = _61 * _117;
    float _147 = _123 * _141;
    float _149 = precise::clamp(_147, 0.0, 1.0);
    float _151 = _149 * _125;
    float _153 = fma(_127, _141, _71);
    float _155 = fma(_143, _141, _73);
    float _157 = fma(_145, _141, _75);
    bool _159 = !_139;
    if (!_159)
    {
        float _161 = gl_FragCoord.x;
        float _163 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _165 = _161 / _163;
        float _167 = gl_FragCoord.y;
        float _169 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _171 = _167 / _169;
        float _173 = trunc(_165);
        int _176 = int(_173);
        float _178 = trunc(_171);
        int _180 = int(_178);
        int _182 = _176 + 2;
        int _184 = _182 >> 1;
        uint _187 = uint(int(uint(_180) >> uint(1)));
        int _189 = _184 ^ int(_187);
        int _191 = _189 << 16;
        int _193 = _191 ^ _184;
        int _195 = 983055 & _193;
        float _197 = _119 * 256.0;
        int _199 = _195 << 6;
        int _201 = _199 + _195;
        float _203 = trunc(_197);
        int _205 = int(_203);
        int _207 = _201 & 13369548;
        uint _209 = uint(int(uint(_207) >> uint(3)));
        int _211 = _207 | int(_209);
        int _213 = _211 & 5570560;
        int _215 = _211 & 85;
        uint _217 = uint(int(uint(_205) >> uint(7)));
        int _219 = int(_217) + _205;
        uint _221 = uint(int(uint(_213) >> uint(15)));
        int _223 = int(_221) + _215;
        bool _225 = uint(_219) > uint(_223);
        if (!_225)
        {
            discard_fragment();
        }
        if (!_225)
        {
            out.m_40.x = _153;
            out.m_40.y = _155;
            out.m_40.z = _157;
            out.m_40.w = _151;
            return out;
        }
    }
    float _227 = _155 * 0.715200006961822509765625;
    float _229 = 0.0 + _151;
    float _231 = precise::clamp(_229, 0.0, 1.0);
    float _233 = fma(_153, 0.2125999927520751953125, _227);
    float _235 = fma(_157, 0.072200000286102294921875, _233);
    float _237 = 1.0 / _235;
    float _239 = _237 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _241 = precise::clamp(_239, 0.0, 1.0);
    float _243 = fma(_241, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _245 = _153 * _243;
    float _247 = _155 * _243;
    float _249 = _157 * _243;
    out.m_40.x = _245;
    out.m_40.y = _247;
    out.m_40.z = _249;
    out.m_40.w = _231;
    return out;
}

