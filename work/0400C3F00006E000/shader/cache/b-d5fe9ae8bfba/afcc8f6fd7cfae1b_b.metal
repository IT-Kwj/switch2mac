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
    float4 m_38 [[user(locn1)]];
};

static inline __attribute__((always_inline))
int _44(thread const int& _976, thread const int& _977, constant _10& support_buffer)
{
    int _980 = 1 + _977;
    float _982 = support_buffer._m5[_980].x;
    float _984 = abs(_982);
    bool _986 = _984 == 1.0;
    if (_986)
    {
        return _976;
    }
    float _988 = float(_976);
    float _990 = _988 / _984;
    int _992 = int(_990);
    return _992;
}

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _48 = gl_FragCoord.w;
    float _50 = in.m_33.x;
    float _52 = gl_FragCoord.w;
    float _54 = _50 * _52;
    float _56 = in.m_33.y;
    float _58 = gl_FragCoord.w;
    float _60 = _56 * _58;
    float _62 = 1.0 / _48;
    float _64 = _62 * _54;
    float _66 = _62 * _60;
    float2 _448 = float2(_64, _66);
    float _68 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_448, float2(0.0), isnan(_448))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_448, float2(0.0), isnan(_448))).x;
    float _70 = -_68;
    float _72 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[6].y, (*spvDescriptorSet0.fp_c3)._m0[6].x);
    float _74 = 1.0 / _72;
    bool _78 = _74 >= (*spvDescriptorSet0.fp_c3)._m0[0].z;
    if (_78)
    {
        discard_fragment();
    }
    float2 _480 = float2(_64, _66);
    float _80 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_480, float2(0.0), isnan(_480))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_480, float2(0.0), isnan(_480))).x;
    if (_78)
    {
        out.m_36.x = 0.0;
        out.m_36.y = 0.0;
        out.m_36.z = 0.0;
        out.m_36.w = 0.0;
        return out;
    }
    float _82 = in.m_38.z;
    float _84 = gl_FragCoord.w;
    float _86 = _82 * _84;
    float _88 = in.m_38.x;
    float _90 = gl_FragCoord.w;
    float _92 = _88 * _90;
    float _94 = in.m_38.y;
    float _96 = gl_FragCoord.w;
    float _98 = _94 * _96;
    float _100 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[4].x, (*spvDescriptorSet0.fp_c3)._m0[5].x);
    float _102 = precise::clamp(_100, 0.0, 1.0);
    float _104 = precise::max(_80, _102);
    float _106 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[4].z, (*spvDescriptorSet0.fp_c3)._m0[5].z);
    float _108 = precise::clamp(_106, 0.0, 1.0);
    float _110 = _62 * _86;
    float _112 = _62 * _92;
    float _114 = precise::max(_104, _110);
    bool _116 = _114 != 0.0;
    bool _118 = isnan(_114);
    bool _120 = _116 || _118;
    bool _122 = isnan(0.0);
    bool _124 = _120 || _122;
    float _126 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[4].w, (*spvDescriptorSet0.fp_c3)._m0[5].w);
    float _128 = precise::clamp(_126, 0.0, 1.0);
    float _130 = _62 * _98;
    float _132 = precise::min(_108, _128);
    bool _134 = !_124;
    if (!_134)
    {
        float _136 = (-1.0) + (*spvDescriptorSet0.fp_c3)._m0[0].y;
        float _138 = fma(_114, _136, 1.0);
        float _140 = log2(_138);
        float _142 = _140 + (-1.0);
        float _144 = trunc(_142);
        int _146 = int(_144);
        int _148 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_146), spvDescriptorSet0.fp_t_tcb_A.get_height(_146)).x;
        int _150 = _148;
        int _152 = 2;
        int _154 = _44(_150, _152, (*spvDescriptorSet0.support_buffer));
        int _156 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_146), spvDescriptorSet0.fp_t_tcb_A.get_height(_146)).y;
        int _158 = _156;
        int _160 = 2;
        int _162 = _44(_158, _160, (*spvDescriptorSet0.support_buffer));
        float _164 = float(_154);
        float _166 = float(_162);
        float _168 = fma(_64, _164, -0.5);
        float _170 = fma(_66, _166, -0.5);
        float _172 = 1.0 / _164;
        float _174 = floor(_168);
        float _176 = floor(_170);
        float _178 = -_174;
        float _180 = _168 + _178;
        float _182 = -_180;
        float _184 = _182 + 1.0;
        float _186 = -_180;
        float _188 = _186 + 2.0;
        float _190 = -_176;
        float _192 = _170 + _190;
        float _194 = _184 * _184;
        float _196 = _188 * _188;
        float _198 = -_192;
        float _200 = _198 + 1.0;
        float _202 = _184 * _194;
        float _204 = -_192;
        float _206 = _204 + 2.0;
        float _208 = _200 * _200;
        float _210 = -_202;
        float _212 = _210 + 6.0;
        float _214 = _206 * _206;
        float _216 = _200 * _208;
        float _218 = _202 * 4.0;
        float _220 = _216 * 4.0;
        float _222 = -_218;
        float _224 = fma(_188, _196, _222);
        float _226 = -_216;
        float _228 = _226 + 6.0;
        float _230 = 1.0 / _166;
        float _232 = -_220;
        float _234 = fma(_206, _214, _232);
        float _236 = -_224;
        float _238 = _236 + _212;
        float _240 = _202 + _224;
        float _242 = _224 * 0.16666667163372039794921875;
        float _244 = _216 + _234;
        float _246 = -_234;
        float _248 = _246 + _228;
        float _250 = _238 * 0.16666667163372039794921875;
        float _252 = _240 * 0.16666667163372039794921875;
        float _254 = _244 * 0.16666667163372039794921875;
        float _256 = _248 * 0.16666667163372039794921875;
        float _258 = 1.0 / _250;
        float _260 = _180 * _180;
        float _262 = _192 * _192;
        float _264 = _234 * 0.16666667163372039794921875;
        float _266 = _180 * _260;
        float _268 = _176 + (-0.5);
        float _270 = _192 * _262;
        float _272 = 1.0 / _254;
        float _274 = _174 + (-0.5);
        float _276 = _174 + 1.5;
        float _278 = _266 * 0.16666667163372039794921875;
        float _280 = _176 + 1.5;
        float _282 = _270 * 0.16666667163372039794921875;
        float _284 = 1.0 / _256;
        float _286 = fma(_278, _258, _276);
        float _288 = _286 * _172;
        float _290 = 1.0 / _252;
        float _292 = fma(_264, _272, _268);
        float _294 = _292 * _230;
        float _296 = fma(_282, _284, _280);
        float _298 = _296 * _230;
        float _300 = fma(_242, _290, _274);
        float _302 = _300 * _172;
        float2 _787 = float2(_302, _294);
        float3 _306 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_787, float2(0.0), isnan(_787)), level(_142)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_787, float2(0.0), isnan(_787)), level(_142)).xyz;
        float _308 = _306.x;
        float _310 = _306.y;
        float _312 = _306.z;
        float2 _802 = float2(_288, _294);
        float3 _314 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_802, float2(0.0), isnan(_802)), level(_142)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_802, float2(0.0), isnan(_802)), level(_142)).xyz;
        float _316 = _314.x;
        float _318 = _314.y;
        float _320 = _314.z;
        float2 _817 = float2(_302, _298);
        float3 _322 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_817, float2(0.0), isnan(_817)), level(_142)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_817, float2(0.0), isnan(_817)), level(_142)).xyz;
        float _324 = _322.x;
        float _326 = _322.y;
        float _328 = _322.z;
        float2 _832 = float2(_288, _298);
        float3 _330 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_832, float2(0.0), isnan(_832)), level(_142)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_832, float2(0.0), isnan(_832)), level(_142)).xyz;
        float _332 = _330.x;
        float _334 = _330.y;
        float _336 = _330.z;
        float _338 = 0.0 + _140;
        float _340 = precise::clamp(_338, 0.0, 1.0);
        float _342 = fma(_130, _340, _112);
        float _344 = -_316;
        float _346 = _308 + _344;
        float _348 = -_318;
        float _350 = _310 + _348;
        float _352 = fma(_252, _346, _316);
        float _354 = -_320;
        float _356 = _312 + _354;
        float _358 = -_332;
        float _360 = _324 + _358;
        float _362 = -_334;
        float _364 = _326 + _362;
        float _366 = -_336;
        float _368 = _328 + _366;
        float _370 = fma(_252, _350, _318);
        float _372 = fma(_252, _360, _332);
        float _374 = fma(_252, _356, _320);
        float _376 = fma(_252, _364, _334);
        float _378 = fma(_252, _368, _336);
        float _380 = -_372;
        float _382 = _380 + _352;
        float _384 = -_376;
        float _386 = _384 + _370;
        float _388 = -_378;
        float _390 = _388 + _374;
        float _392 = fma(_254, _382, _372);
        float _394 = fma(_254, _386, _376);
        float _396 = fma(_254, _390, _378);
        float _398 = -_392;
        float _400 = fma(_392, (*spvDescriptorSet0.fp_c3)._m0[13].x, _398);
        float _402 = -_394;
        float _404 = fma(_394, (*spvDescriptorSet0.fp_c3)._m0[13].y, _402);
        float _406 = -_396;
        float _408 = fma(_396, (*spvDescriptorSet0.fp_c3)._m0[13].z, _406);
        float _410 = fma(_132, _400, _392);
        float _412 = fma(_132, _404, _394);
        float _414 = fma(_132, _408, _396);
        out.m_36.x = _410;
        out.m_36.y = _412;
        out.m_36.z = _414;
        out.m_36.w = _342;
        return out;
    }
    discard_fragment();
    return out;
}

