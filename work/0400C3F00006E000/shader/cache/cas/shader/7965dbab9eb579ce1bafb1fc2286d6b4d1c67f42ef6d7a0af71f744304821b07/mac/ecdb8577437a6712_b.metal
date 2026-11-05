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
    texture2d<float> fp_t_tcb_1A [[id(2)]];
    sampler fp_t_tcb_1ASmplr [[id(3)]];
    sampler fp_t_tcb_1ASmplr_w [[id(4)]];
    constant dm_border_t* dm_border [[id(5)]];
};

struct main0_out
{
    float4 m_38 [[color(0)]];
};

struct main0_in
{
    float4 m_33 [[user(locn0)]];
    float4 m_40 [[user(locn2)]];
    float4 m_35 [[user(locn3)]];
    float4 m_29 [[user(locn4)]];
    float4 m_31 [[user(locn6)]];
    float4 m_42 [[user(locn7)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _49 = gl_FragCoord.w;
    float _51 = in.m_29.w;
    float _53 = gl_FragCoord.w;
    float _55 = _51 * _53;
    float _57 = in.m_31.w;
    float _59 = gl_FragCoord.w;
    float _61 = _57 * _59;
    float _63 = in.m_33.w;
    float _65 = gl_FragCoord.w;
    float _67 = _63 * _65;
    float _69 = in.m_35.x;
    float _71 = gl_FragCoord.w;
    float _73 = _69 * _71;
    float _75 = in.m_33.x;
    float _77 = gl_FragCoord.w;
    float _79 = _75 * _77;
    float _81 = in.m_33.y;
    float _83 = gl_FragCoord.w;
    float _85 = _81 * _83;
    float _87 = in.m_33.z;
    float _89 = gl_FragCoord.w;
    float _91 = _87 * _89;
    float _93 = 1.0 / _49;
    float _95 = _93 * _55;
    float _97 = _93 * _61;
    float _99 = _93 * _67;
    float _101 = _93 * _73;
    bool _105 = _97 != 1.0;
    bool _107 = isnan(_97);
    bool _109 = _105 || _107;
    bool _111 = isnan(1.0);
    bool _113 = _109 || _111;
    float _115 = _99 * _95;
    float _117 = precise::clamp(_115, 0.0, 1.0);
    float _119 = _93 * _85;
    float _121 = _117 * _101;
    float _123 = _93 * _79;
    float _125 = _93 * _91;
    bool _127 = !_113;
    if (!_127)
    {
        float _129 = gl_FragCoord.x;
        float _131 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _133 = _129 / _131;
        float _135 = gl_FragCoord.y;
        float _137 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _139 = _135 / _137;
        float _141 = _97 * 256.0;
        float _143 = trunc(_141);
        int _146 = int(_143);
        float _148 = trunc(_133);
        int _150 = int(_148);
        float _152 = trunc(_139);
        int _154 = int(_152);
        int _156 = _150 + 2;
        int _158 = _156 >> 1;
        uint _161 = uint(int(uint(_154) >> uint(1)));
        int _163 = _158 ^ int(_161);
        int _165 = _163 << 16;
        int _167 = _165 ^ _158;
        int _169 = 983055 & _167;
        int _171 = _169 << 6;
        int _173 = _171 + _169;
        int _175 = _173 & 13369548;
        uint _177 = uint(int(uint(_175) >> uint(3)));
        int _179 = _175 | int(_177);
        uint _181 = uint(int(uint(_146) >> uint(7)));
        int _183 = int(_181) + _146;
        int _185 = _179 & 5570560;
        int _187 = _179 & 85;
        uint _189 = uint(int(uint(_185) >> uint(15)));
        int _191 = int(_189) + _187;
        bool _193 = uint(_183) > uint(_191);
        if (!_193)
        {
            discard_fragment();
        }
        if (!_193)
        {
            out.m_38.x = _123;
            out.m_38.y = _119;
            out.m_38.z = _125;
            out.m_38.w = _121;
            return out;
        }
    }
    float _195 = in.m_40.w;
    float _197 = gl_FragCoord.w;
    float _199 = _195 * _197;
    float _201 = in.m_40.x;
    float _203 = gl_FragCoord.w;
    float _205 = _201 * _203;
    float _207 = in.m_40.y;
    float _209 = gl_FragCoord.w;
    float _211 = _207 * _209;
    float _213 = _93 * _199;
    float _215 = _93 * _205;
    float _217 = _93 * _211;
    float _219 = 1.0 / _213;
    float _221 = _215 * _219;
    float _223 = _217 * _219;
    float2 _561 = float2(_221, _223);
    float4 _226 = dm_bs(spvDescriptorSet0.fp_t_tcb_1A.sample(spvDescriptorSet0.fp_t_tcb_1ASmplr, select(_561, float2(0.0), isnan(_561))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_1A, spvDescriptorSet0.fp_t_tcb_1ASmplr_w, select(_561, float2(0.0), isnan(_561))).xyzw;
    float _228 = _226.x;
    float _230 = _226.y;
    float _232 = _226.z;
    float _234 = _226.w;
    float _236 = in.m_42.w;
    float _238 = gl_FragCoord.w;
    float _240 = _236 * _238;
    float _242 = _119 * 0.715200006961822509765625;
    float _244 = in.m_42.x;
    float _246 = gl_FragCoord.w;
    float _248 = _244 * _246;
    float _250 = in.m_42.y;
    float _252 = gl_FragCoord.w;
    float _254 = _250 * _252;
    float _256 = in.m_42.z;
    float _258 = gl_FragCoord.w;
    float _260 = _256 * _258;
    float _262 = fma(_123, 0.2125999927520751953125, _242);
    float _264 = 0.0 + _121;
    float _266 = precise::clamp(_264, 0.0, 1.0);
    float _268 = fma(_125, 0.072200000286102294921875, _262);
    float _270 = 1.0 / _268;
    float _272 = _270 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _274 = precise::clamp(_272, 0.0, 1.0);
    float _276 = _93 * _240;
    float _278 = _93 * _248;
    float _280 = fma(_274, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _282 = _93 * _254;
    float _284 = _93 * _260;
    float _286 = _234 * _276;
    float _288 = fma(_234, _278, _228);
    float _290 = _280 * _286;
    float _292 = fma(_234, _282, _230);
    float _294 = fma(_234, _284, _232);
    float _296 = fma(_123, _290, _288);
    float _298 = fma(_119, _290, _292);
    float _300 = fma(_125, _290, _294);
    out.m_38.x = _296;
    out.m_38.y = _298;
    out.m_38.z = _300;
    out.m_38.w = _266;
    return out;
}

