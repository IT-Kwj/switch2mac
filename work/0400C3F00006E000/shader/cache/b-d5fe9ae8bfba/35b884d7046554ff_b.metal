#pragma clang diagnostic ignored "-Wmissing-prototypes"

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
    constant _16* fp_c3 [[id(1)]];
    texture2d<float> fp_t_tcb_8 [[id(2)]];
    sampler fp_t_tcb_8Smplr [[id(3)]];
    texture2d<float> fp_t_tcb_C [[id(4)]];
    sampler fp_t_tcb_CSmplr [[id(5)]];
    texture2d<float> fp_t_tcb_A [[id(6)]];
    sampler fp_t_tcb_ASmplr [[id(7)]];
    sampler fp_t_tcb_8Smplr_w [[id(8)]];
    sampler fp_t_tcb_CSmplr_w [[id(9)]];
    sampler fp_t_tcb_ASmplr_w [[id(10)]];
    constant dm_border_t* dm_border [[id(11)]];
};

struct main0_out
{
    float4 m_36 [[color(0)]];
};

struct main0_in
{
    float4 m_33 [[user(locn0)]];
};

static inline __attribute__((always_inline))
int _42(thread const int& _812, thread const int& _813, constant _10& support_buffer)
{
    int _816 = 1 + _813;
    float _818 = support_buffer._m5[_816].x;
    float _820 = abs(_818);
    bool _822 = _820 == 1.0;
    if (_822)
    {
        return _812;
    }
    float _824 = float(_812);
    float _826 = _824 / _820;
    int _828 = int(_826);
    return _828;
}

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _46 = gl_FragCoord.w;
    float _48 = in.m_33.x;
    float _50 = gl_FragCoord.w;
    float _52 = _48 * _50;
    float _54 = in.m_33.y;
    float _56 = gl_FragCoord.w;
    float _58 = _54 * _56;
    float _60 = 1.0 / _46;
    float _62 = _60 * _52;
    float _64 = _60 * _58;
    float2 _388 = float2(_62, _64);
    float _66 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_388, float2(0.0), isnan(_388))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_388, float2(0.0), isnan(_388))).x;
    float2 _399 = float2(_62, _64);
    float _68 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_399, float2(0.0), isnan(_399))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_399, float2(0.0), isnan(_399))).x;
    float _70 = -_66;
    float _72 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[6].y, (*spvDescriptorSet0.fp_c3)._m0[6].x);
    float _74 = 1.0 / _72;
    float _76 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[4].x, (*spvDescriptorSet0.fp_c3)._m0[5].x);
    float _78 = precise::clamp(_76, 0.0, 1.0);
    float _80 = precise::max(_68, _78);
    bool _84 = _80 != 0.0;
    bool _86 = isnan(_80);
    bool _88 = _84 || _86;
    bool _90 = isnan(0.0);
    bool _92 = _88 || _90;
    bool _94 = !_92;
    if (!_94)
    {
        float _96 = (-1.0) + (*spvDescriptorSet0.fp_c3)._m0[0].y;
        float _98 = fma(_80, _96, 1.0);
        float _100 = log2(_98);
        float _102 = _100 + (-1.0);
        float _104 = trunc(_102);
        int _106 = int(_104);
        int _108 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_106), spvDescriptorSet0.fp_t_tcb_A.get_height(_106)).x;
        int _110 = _108;
        int _112 = 2;
        int _114 = _42(_110, _112, (*spvDescriptorSet0.support_buffer));
        int _116 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_106), spvDescriptorSet0.fp_t_tcb_A.get_height(_106)).y;
        int _118 = _116;
        int _120 = 2;
        int _122 = _42(_118, _120, (*spvDescriptorSet0.support_buffer));
        float _124 = float(_114);
        float _126 = float(_122);
        float _128 = fma(_62, _124, -0.5);
        float _130 = fma(_64, _126, -0.5);
        float _132 = 1.0 / _124;
        float _134 = floor(_128);
        float _136 = floor(_130);
        float _138 = -_134;
        float _140 = _128 + _138;
        float _142 = 1.0 / _126;
        float _144 = -_140;
        float _146 = _144 + 1.0;
        float _148 = -_140;
        float _150 = _148 + 2.0;
        float _152 = -_136;
        float _154 = _130 + _152;
        float _156 = _146 * _146;
        float _158 = -_154;
        float _160 = _158 + 1.0;
        float _162 = _146 * _156;
        float _164 = -_154;
        float _166 = _164 + 2.0;
        float _168 = _150 * _150;
        float _170 = _160 * _160;
        float _172 = _162 * 4.0;
        float _174 = _160 * _170;
        float _176 = _166 * _166;
        float _178 = -_172;
        float _180 = fma(_150, _168, _178);
        float _182 = -_162;
        float _184 = _182 + 6.0;
        float _186 = _174 * 4.0;
        float _188 = -_174;
        float _190 = _188 + 6.0;
        float _192 = _140 * _140;
        float _194 = -_180;
        float _196 = _194 + _184;
        float _198 = -_186;
        float _200 = fma(_166, _176, _198);
        float _202 = _154 * _154;
        float _204 = _140 * _192;
        float _206 = _196 * 0.16666667163372039794921875;
        float _208 = -_200;
        float _210 = _208 + _190;
        float _212 = _162 + _180;
        float _214 = _154 * _202;
        float _216 = _136 + (-0.5);
        float _218 = _210 * 0.16666667163372039794921875;
        float _220 = _174 + _200;
        float _222 = _212 * 0.16666667163372039794921875;
        float _224 = 1.0 / _206;
        float _226 = _200 * 0.16666667163372039794921875;
        float _228 = _220 * 0.16666667163372039794921875;
        float _230 = _134 + (-0.5);
        float _232 = _180 * 0.16666667163372039794921875;
        float _234 = _134 + 1.5;
        float _236 = _136 + 1.5;
        float _238 = _204 * 0.16666667163372039794921875;
        float _240 = 1.0 / _228;
        float _242 = _214 * 0.16666667163372039794921875;
        float _244 = 1.0 / _222;
        float _246 = fma(_238, _224, _234);
        float _248 = 1.0 / _218;
        float _250 = fma(_226, _240, _216);
        float _252 = _246 * _132;
        float _254 = _250 * _142;
        float _256 = fma(_232, _244, _230);
        float _258 = _256 * _132;
        float _260 = fma(_242, _248, _236);
        float _262 = _260 * _142;
        float2 _660 = float2(_258, _254);
        float3 _266 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_660, float2(0.0), isnan(_660)), level(_102)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_660, float2(0.0), isnan(_660)), level(_102)).xyz;
        float _268 = _266.x;
        float _270 = _266.y;
        float _272 = _266.z;
        float2 _675 = float2(_252, _254);
        float3 _274 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_675, float2(0.0), isnan(_675)), level(_102)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_675, float2(0.0), isnan(_675)), level(_102)).xyz;
        float _276 = _274.x;
        float _278 = _274.y;
        float _280 = _274.z;
        float2 _690 = float2(_258, _262);
        float3 _282 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_690, float2(0.0), isnan(_690)), level(_102)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_690, float2(0.0), isnan(_690)), level(_102)).xyz;
        float _284 = _282.x;
        float _286 = _282.y;
        float _288 = _282.z;
        float2 _705 = float2(_252, _262);
        float3 _290 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_705, float2(0.0), isnan(_705)), level(_102)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_705, float2(0.0), isnan(_705)), level(_102)).xyz;
        float _292 = _290.x;
        float _294 = _290.y;
        float _296 = _290.z;
        float _298 = 0.0 + _100;
        float _300 = precise::clamp(_298, 0.0, 1.0);
        float _302 = -_276;
        float _304 = _268 + _302;
        float _306 = -_278;
        float _308 = _270 + _306;
        float _310 = -_280;
        float _312 = _272 + _310;
        float _314 = fma(_222, _304, _276);
        float _316 = fma(_222, _308, _278);
        float _318 = fma(_222, _312, _280);
        float _320 = -_292;
        float _322 = _284 + _320;
        float _324 = -_294;
        float _326 = _286 + _324;
        float _328 = -_296;
        float _330 = _288 + _328;
        float _332 = fma(_222, _322, _292);
        float _334 = fma(_222, _326, _294);
        float _336 = fma(_222, _330, _296);
        float _338 = -_332;
        float _340 = _338 + _314;
        float _342 = -_334;
        float _344 = _342 + _316;
        float _346 = -_336;
        float _348 = _346 + _318;
        float _350 = fma(_228, _340, _332);
        float _352 = fma(_228, _344, _334);
        float _354 = fma(_228, _348, _336);
        out.m_36.x = _350;
        out.m_36.y = _352;
        out.m_36.z = _354;
        out.m_36.w = _300;
        return out;
    }
    discard_fragment();
    return out;
}

