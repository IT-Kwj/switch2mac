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
    constant _16* fp_c4 [[id(1)]];
    texture2d<float> fp_t_tcb_14 [[id(2)]];
    sampler fp_t_tcb_14Smplr [[id(3)]];
    sampler fp_t_tcb_14Smplr_w [[id(4)]];
    constant dm_border_t* dm_border [[id(5)]];
};

struct main0_out
{
    float4 m_36 [[color(0)]];
};

struct main0_in
{
    float4 m_29 [[user(locn0)]];
    float4 m_31 [[user(locn4)]];
    float4 m_33 [[user(locn5)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _43 = gl_FragCoord.w;
    float _45 = in.m_29.x;
    float _47 = gl_FragCoord.w;
    float _49 = _45 * _47;
    float _51 = in.m_29.y;
    float _53 = gl_FragCoord.w;
    float _55 = _51 * _53;
    float _57 = 1.0 / _43;
    float _59 = _57 * _49;
    float _61 = _57 * _55;
    float2 _241 = float2(_59, _61);
    float _63 = dm_bs(spvDescriptorSet0.fp_t_tcb_14.sample(spvDescriptorSet0.fp_t_tcb_14Smplr, select(_241, float2(0.0), isnan(_241))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_14, spvDescriptorSet0.fp_t_tcb_14Smplr_w, select(_241, float2(0.0), isnan(_241))).w;
    float _65 = in.m_31.y;
    float _67 = gl_FragCoord.w;
    float _69 = _65 * _67;
    float _71 = in.m_31.x;
    float _73 = gl_FragCoord.w;
    float _75 = _71 * _73;
    float _77 = in.m_31.z;
    float _79 = gl_FragCoord.w;
    float _81 = _77 * _79;
    float _83 = _57 * _69;
    float _85 = _57 * _75;
    float _87 = -(*spvDescriptorSet0.fp_c4)._m0[12].w;
    float _89 = _83 + _87;
    float _91 = _57 * _81;
    float _93 = -(*spvDescriptorSet0.fp_c4)._m0[11].w;
    float _95 = _85 + _93;
    float _97 = _89 * _89;
    float _99 = -(*spvDescriptorSet0.fp_c4)._m0[13].w;
    float _101 = _91 + _99;
    float _103 = fma(_95, _95, _97);
    float _105 = in.m_33.x;
    float _107 = gl_FragCoord.w;
    float _109 = _105 * _107;
    float _111 = fma(_101, _101, _103);
    float _113 = sqrt(_111);
    float _115 = fma(_113, 0.02222222276031970977783203125, -0.111111111938953399658203125);
    float _117 = precise::clamp(_115, 0.0, 1.0);
    float _119 = _117 * _117;
    float _121 = _119 * _119;
    float _123 = _119 * _121;
    float _125 = _57 * _109;
    float _127 = fma(_123, 100.0, 1.0);
    float _129 = fma(_125, _63, -0.819999992847442626953125);
    float _131 = fma(_127, _129, 0.819999992847442626953125);
    float _133 = precise::clamp(_131, 0.0, 1.0);
    float _135 = _133 * 256.0;
    float _137 = trunc(_135);
    float _139 = precise::max(_137, 0.0);
    uint _142 = uint(_139);
    int _145 = int(_142) * 255;
    uint _147 = uint(int(uint(_145) >> uint(8)));
    bool _151 = int(_147) != 255;
    bool _153 = !_151;
    if (!_153)
    {
        bool _155 = int(_147) != 0;
        if (!_155)
        {
            discard_fragment();
        }
        if (!_155)
        {
            out.m_36.x = 0.0;
            out.m_36.y = 0.0;
            out.m_36.z = 0.0;
            out.m_36.w = 0.0;
            return out;
        }
        float _157 = gl_FragCoord.x;
        float _159 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _161 = _157 / _159;
        float _163 = gl_FragCoord.y;
        float _165 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _167 = _163 / _165;
        float _169 = trunc(_161);
        float _171 = precise::max(_169, 0.0);
        uint _173 = uint(_171);
        float _175 = trunc(_167);
        float _177 = precise::max(_175, 0.0);
        uint _179 = uint(_177);
        int _181 = int(_173) ^ int(_179);
        int _183 = _181 << 16;
        int _185 = _183 ^ int(_173);
        int _187 = 983055 & _185;
        int _189 = _187 << 6;
        int _191 = _189 + _187;
        int _193 = _191 & 13369548;
        uint _195 = uint(int(uint(_193) >> uint(3)));
        int _197 = _193 | int(_195);
        int _199 = _197 & 5570560;
        int _201 = _197 & 85;
        uint _203 = uint(int(uint(_199) >> uint(15)));
        int _205 = int(_203) + _201;
        bool _207 = _147 >= uint(_205);
        if (!_207)
        {
            discard_fragment();
        }
        if (!_207)
        {
            out.m_36.x = 0.0;
            out.m_36.y = 0.0;
            out.m_36.z = 0.0;
            out.m_36.w = 0.0;
            return out;
        }
    }
    out.m_36.x = 1.0;
    out.m_36.y = 1.0;
    out.m_36.z = 1.0;
    out.m_36.w = 1.0;
    return out;
}


struct main0_out_u
{
    uint4 m_36 [[color(0)]];
};

fragment main0_out_u main0_u(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _43 = gl_FragCoord.w;
    float _45 = in.m_29.x;
    float _47 = gl_FragCoord.w;
    float _49 = _45 * _47;
    float _51 = in.m_29.y;
    float _53 = gl_FragCoord.w;
    float _55 = _51 * _53;
    float _57 = 1.0 / _43;
    float _59 = _57 * _49;
    float _61 = _57 * _55;
    float2 _241 = float2(_59, _61);
    float _63 = dm_bs(spvDescriptorSet0.fp_t_tcb_14.sample(spvDescriptorSet0.fp_t_tcb_14Smplr, select(_241, float2(0.0), isnan(_241))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_14, spvDescriptorSet0.fp_t_tcb_14Smplr_w, select(_241, float2(0.0), isnan(_241))).w;
    float _65 = in.m_31.y;
    float _67 = gl_FragCoord.w;
    float _69 = _65 * _67;
    float _71 = in.m_31.x;
    float _73 = gl_FragCoord.w;
    float _75 = _71 * _73;
    float _77 = in.m_31.z;
    float _79 = gl_FragCoord.w;
    float _81 = _77 * _79;
    float _83 = _57 * _69;
    float _85 = _57 * _75;
    float _87 = -(*spvDescriptorSet0.fp_c4)._m0[12].w;
    float _89 = _83 + _87;
    float _91 = _57 * _81;
    float _93 = -(*spvDescriptorSet0.fp_c4)._m0[11].w;
    float _95 = _85 + _93;
    float _97 = _89 * _89;
    float _99 = -(*spvDescriptorSet0.fp_c4)._m0[13].w;
    float _101 = _91 + _99;
    float _103 = fma(_95, _95, _97);
    float _105 = in.m_33.x;
    float _107 = gl_FragCoord.w;
    float _109 = _105 * _107;
    float _111 = fma(_101, _101, _103);
    float _113 = sqrt(_111);
    float _115 = fma(_113, 0.02222222276031970977783203125, -0.111111111938953399658203125);
    float _117 = precise::clamp(_115, 0.0, 1.0);
    float _119 = _117 * _117;
    float _121 = _119 * _119;
    float _123 = _119 * _121;
    float _125 = _57 * _109;
    float _127 = fma(_123, 100.0, 1.0);
    float _129 = fma(_125, _63, -0.819999992847442626953125);
    float _131 = fma(_127, _129, 0.819999992847442626953125);
    float _133 = precise::clamp(_131, 0.0, 1.0);
    float _135 = _133 * 256.0;
    float _137 = trunc(_135);
    float _139 = precise::max(_137, 0.0);
    uint _142 = uint(_139);
    int _145 = int(_142) * 255;
    uint _147 = uint(int(uint(_145) >> uint(8)));
    bool _151 = int(_147) != 255;
    bool _153 = !_151;
    if (!_153)
    {
        bool _155 = int(_147) != 0;
        if (!_155)
        {
            discard_fragment();
        }
        if (!_155)
        {
            out.m_36.x = 0.0;
            out.m_36.y = 0.0;
            out.m_36.z = 0.0;
            out.m_36.w = 0.0;
            return main0_out_u{as_type<uint4>(out.m_36)};
        }
        float _157 = gl_FragCoord.x;
        float _159 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _161 = _157 / _159;
        float _163 = gl_FragCoord.y;
        float _165 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _167 = _163 / _165;
        float _169 = trunc(_161);
        float _171 = precise::max(_169, 0.0);
        uint _173 = uint(_171);
        float _175 = trunc(_167);
        float _177 = precise::max(_175, 0.0);
        uint _179 = uint(_177);
        int _181 = int(_173) ^ int(_179);
        int _183 = _181 << 16;
        int _185 = _183 ^ int(_173);
        int _187 = 983055 & _185;
        int _189 = _187 << 6;
        int _191 = _189 + _187;
        int _193 = _191 & 13369548;
        uint _195 = uint(int(uint(_193) >> uint(3)));
        int _197 = _193 | int(_195);
        int _199 = _197 & 5570560;
        int _201 = _197 & 85;
        uint _203 = uint(int(uint(_199) >> uint(15)));
        int _205 = int(_203) + _201;
        bool _207 = _147 >= uint(_205);
        if (!_207)
        {
            discard_fragment();
        }
        if (!_207)
        {
            out.m_36.x = 0.0;
            out.m_36.y = 0.0;
            out.m_36.z = 0.0;
            out.m_36.w = 0.0;
            return main0_out_u{as_type<uint4>(out.m_36)};
        }
    }
    out.m_36.x = 1.0;
    out.m_36.y = 1.0;
    out.m_36.z = 1.0;
    out.m_36.w = 1.0;
    return main0_out_u{as_type<uint4>(out.m_36)};
}

