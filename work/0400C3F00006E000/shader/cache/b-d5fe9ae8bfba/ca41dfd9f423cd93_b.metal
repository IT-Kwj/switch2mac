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
    float4 m_31 [[user(locn0)]];
    float4 m_35 [[user(locn1)]];
    float4 m_33 [[user(locn2)]];
    float4 m_29 [[user(locn3)]];
    float4 m_40 [[user(locn4)]];
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
    float2 _308 = float2(_63, _65);
    float4 _68 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_308, float2(0.0), isnan(_308))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_308, float2(0.0), isnan(_308))).xyzw;
    float _70 = _68.x;
    float _72 = _68.y;
    float _74 = _68.z;
    float _76 = _68.w;
    float _78 = in.m_31.w;
    float _80 = gl_FragCoord.w;
    float _82 = _78 * _80;
    float _84 = in.m_33.x;
    float _86 = gl_FragCoord.w;
    float _88 = _84 * _86;
    float _90 = in.m_35.x;
    float _92 = gl_FragCoord.w;
    float _94 = _90 * _92;
    float _96 = _61 * _82;
    float _98 = _61 * _88;
    float _100 = in.m_31.x;
    float _102 = gl_FragCoord.w;
    float _104 = _100 * _102;
    float _106 = in.m_35.y;
    float _108 = gl_FragCoord.w;
    float _110 = _106 * _108;
    float _112 = in.m_31.z;
    float _114 = gl_FragCoord.w;
    float _116 = _112 * _114;
    float _118 = in.m_35.z;
    float _120 = gl_FragCoord.w;
    float _122 = _118 * _120;
    float _124 = _61 * _94;
    float _126 = _61 * _104;
    float _128 = _61 * _110;
    float _130 = _61 * _116;
    float _132 = -_124;
    float _134 = _126 + _132;
    float _136 = _76 * _96;
    float _138 = 0.0 + _136;
    float _140 = precise::clamp(_138, 0.0, 1.0);
    float _142 = _140 * _98;
    bool _146 = _142 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _148 = isnan(_142);
    bool _150 = _146 || _148;
    bool _152 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _154 = _150 || _152;
    float _156 = in.m_31.y;
    float _158 = gl_FragCoord.w;
    float _160 = _156 * _158;
    if (!_154)
    {
        discard_fragment();
    }
    float _162 = _61 * _122;
    float _164 = _70 * _70;
    float _166 = _72 * _72;
    float _168 = -_162;
    float _170 = _130 + _168;
    float _172 = fma(_164, _134, _124);
    float _174 = _61 * _160;
    float _176 = _74 * _74;
    float _178 = -_128;
    float _180 = _174 + _178;
    float _182 = fma(_176, _170, _162);
    float _184 = fma(_166, _180, _128);
    if (!_154)
    {
        out.m_38.x = _172;
        out.m_38.y = _184;
        out.m_38.z = _182;
        out.m_38.w = _136;
        return out;
    }
    float _186 = in.m_40.w;
    float _188 = gl_FragCoord.w;
    float _190 = _186 * _188;
    float _192 = _61 * _190;
    bool _194 = _192 != 1.0;
    bool _196 = isnan(_192);
    bool _198 = _194 || _196;
    bool _200 = isnan(1.0);
    bool _202 = _198 || _200;
    bool _204 = !_202;
    if (!_204)
    {
        float _206 = gl_FragCoord.x;
        float _208 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _210 = _206 / _208;
        float _212 = gl_FragCoord.y;
        float _214 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _216 = _212 / _214;
        float _218 = _192 * 256.0;
        float _220 = trunc(_218);
        int _223 = int(_220);
        float _225 = trunc(_210);
        int _227 = int(_225);
        float _229 = trunc(_216);
        int _231 = int(_229);
        int _233 = _227 + 2;
        int _235 = _233 >> 1;
        uint _238 = uint(int(uint(_231) >> uint(1)));
        int _240 = _235 ^ int(_238);
        int _242 = _240 << 16;
        int _244 = _242 ^ _235;
        int _246 = 983055 & _244;
        int _248 = _246 << 6;
        int _250 = _248 + _246;
        int _252 = _250 & 13369548;
        uint _254 = uint(int(uint(_252) >> uint(3)));
        int _256 = _252 | int(_254);
        uint _258 = uint(int(uint(_223) >> uint(7)));
        int _260 = int(_258) + _223;
        int _262 = _256 & 5570560;
        int _264 = _256 & 85;
        uint _266 = uint(int(uint(_262) >> uint(15)));
        int _268 = int(_266) + _264;
        bool _270 = uint(_260) > uint(_268);
        if (!_270)
        {
            discard_fragment();
        }
        if (!_270)
        {
            out.m_38.x = _172;
            out.m_38.y = _184;
            out.m_38.z = _182;
            out.m_38.w = _142;
            return out;
        }
    }
    float _272 = 0.0 + _142;
    float _274 = precise::clamp(_272, 0.0, 1.0);
    out.m_38.x = 1.0;
    out.m_38.y = 1.0;
    out.m_38.z = 1.0;
    out.m_38.w = _274;
    return out;
}

