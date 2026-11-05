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
    texture2d<float> fp_t_tcb_8 [[id(2)]];
    sampler fp_t_tcb_8Smplr [[id(3)]];
    sampler fp_t_tcb_8Smplr_w [[id(4)]];
    constant dm_border_t* dm_border [[id(5)]];
};

struct main0_out
{
    float4 m_38 [[color(0)]];
};

struct main0_in
{
    float4 m_33 [[user(locn0)]];
    float4 m_29 [[user(locn2)]];
    float4 m_35 [[user(locn3)]];
    float4 m_31 [[user(locn4)]];
    float4 m_40 [[user(locn5)]];
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
    float2 _261 = float2(_63, _65);
    float _67 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_261, float2(0.0), isnan(_261))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_261, float2(0.0), isnan(_261))).w;
    float _69 = in.m_31.w;
    float _71 = gl_FragCoord.w;
    float _73 = _69 * _71;
    float _75 = in.m_33.w;
    float _77 = gl_FragCoord.w;
    float _79 = _75 * _77;
    float _81 = in.m_35.x;
    float _83 = gl_FragCoord.w;
    float _85 = _81 * _83;
    float _87 = _61 * _73;
    float _89 = _61 * _79;
    float _91 = in.m_33.y;
    float _93 = gl_FragCoord.w;
    float _95 = _91 * _93;
    float _97 = _61 * _95;
    float _99 = _67 * _87;
    float _101 = _61 * _85;
    float _103 = _89 * _99;
    float _105 = 0.0 + _103;
    float _107 = precise::clamp(_105, 0.0, 1.0);
    float _109 = _107 * _101;
    bool _113 = _109 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _115 = isnan(_109);
    bool _117 = _113 || _115;
    bool _119 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _121 = _117 || _119;
    float _123 = in.m_33.x;
    float _125 = gl_FragCoord.w;
    float _127 = _123 * _125;
    float _129 = in.m_33.z;
    float _131 = gl_FragCoord.w;
    float _133 = _129 * _131;
    if (!_121)
    {
        discard_fragment();
    }
    float _135 = _61 * _127;
    float _137 = _61 * _133;
    if (!_121)
    {
        out.m_38.x = _135;
        out.m_38.y = _97;
        out.m_38.z = _137;
        out.m_38.w = _103;
        return out;
    }
    float _139 = in.m_40.w;
    float _141 = gl_FragCoord.w;
    float _143 = _139 * _141;
    float _145 = _61 * _143;
    bool _147 = _145 != 1.0;
    bool _149 = isnan(_145);
    bool _151 = _147 || _149;
    bool _153 = isnan(1.0);
    bool _155 = _151 || _153;
    bool _157 = !_155;
    if (!_157)
    {
        float _159 = gl_FragCoord.x;
        float _161 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _163 = _159 / _161;
        float _165 = gl_FragCoord.y;
        float _167 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _169 = _165 / _167;
        float _171 = _145 * 256.0;
        float _173 = trunc(_171);
        int _176 = int(_173);
        float _178 = trunc(_163);
        int _180 = int(_178);
        float _182 = trunc(_169);
        int _184 = int(_182);
        int _186 = _180 + 2;
        int _188 = _186 >> 1;
        uint _191 = uint(int(uint(_184) >> uint(1)));
        int _193 = _188 ^ int(_191);
        int _195 = _193 * 65536;
        int _197 = _195 ^ _188;
        int _199 = 983055 & _197;
        int _201 = _199 * 64;
        int _203 = _201 + _199;
        int _205 = _203 & 13369548;
        uint _207 = uint(int(uint(_205) >> uint(3)));
        int _209 = _205 | int(_207);
        uint _211 = uint(int(uint(_176) >> uint(7)));
        int _213 = int(_211) + _176;
        int _215 = _209 & 5570560;
        int _217 = _209 & 85;
        uint _219 = uint(int(uint(_215) >> uint(15)));
        int _221 = int(_219) + _217;
        bool _223 = uint(_213) > uint(_221);
        if (!_223)
        {
            discard_fragment();
        }
        if (!_223)
        {
            out.m_38.x = _135;
            out.m_38.y = _97;
            out.m_38.z = _137;
            out.m_38.w = _109;
            return out;
        }
    }
    float _225 = 0.0 + _109;
    float _227 = precise::clamp(_225, 0.0, 1.0);
    out.m_38.x = 1.0;
    out.m_38.y = 1.0;
    out.m_38.z = 1.0;
    out.m_38.w = _227;
    return out;
}

