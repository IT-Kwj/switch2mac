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
    constant _16* vp_c8 [[id(1)]];
    constant _16* vp_c10 [[id(2)]];
    constant _16* vp_c9 [[id(3)]];
    constant _16* vp_c15 [[id(4)]];
    constant _16* vp_c16 [[id(5)]];
    constant _16* vp_c7 [[id(6)]];
    texture2d<float> vp_t_tcb_C [[id(7)]];
    sampler vp_t_tcb_CSmplr [[id(8)]];
    texture3d<float> vp_t_tcb_32 [[id(9)]];
    sampler vp_t_tcb_32Smplr [[id(10)]];
    texture3d<float> vp_t_tcb_30 [[id(11)]];
    sampler vp_t_tcb_30Smplr [[id(12)]];
    texture2d<float> vp_t_tcb_1C [[id(13)]];
    sampler vp_t_tcb_1CSmplr [[id(14)]];
    sampler vp_t_tcb_32Smplr_w [[id(15)]];
    sampler vp_t_tcb_30Smplr_w [[id(16)]];
    sampler vp_t_tcb_1CSmplr_w [[id(17)]];
    constant dm_border_t* dm_border [[id(18)]];
};

struct main0_out
{
    float4 m_63 [[user(locn0)]];
    float4 m_61 [[user(locn1)]];
    float4 m_65 [[user(locn2)]];
    float4 m_49 [[user(locn3)]];
    float4 m_57 [[user(locn4)]];
    float4 m_67 [[user(locn6)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_46 [[attribute(2)]];
    float4 m_51 [[attribute(3)]];
    float4 m_59 [[attribute(5)]];
    float4 m_55 [[attribute(6)]];
    float4 m_53 [[attribute(7)]];
};

static inline __attribute__((always_inline))
int _82(thread const int& _5195, thread const int& _5196, constant _10& support_buffer)
{
    float _5199 = as_type<float>(support_buffer._m4);
    int _5201 = _5196 + as_type<int>(_5199);
    int _5203 = 1 + _5201;
    float _5205 = support_buffer._m5[_5203].x;
    float _5207 = abs(_5205);
    bool _5209 = _5207 == 1.0;
    if (_5209)
    {
        return _5195;
    }
    float _5211 = float(_5195);
    float _5213 = _5211 / _5207;
    int _5215 = int(_5213);
    return _5215;
}

static inline __attribute__((always_inline))
int _83(thread const int& _5245, thread const int& _5246, constant _10& support_buffer)
{
    float _5249 = as_type<float>(support_buffer._m4);
    int _5251 = _5246 + as_type<int>(_5249);
    int _5253 = 1 + _5251;
    float _5255 = support_buffer._m5[_5253].x;
    bool _5257 = _5255 == 1.0;
    if (_5257)
    {
        return _5245;
    }
    float _5259 = float(_5245);
    float _5261 = _5259 * _5255;
    int _5263 = int(_5261);
    return _5263;
}

static inline __attribute__((always_inline))
void _80(thread const int& _4874, thread const int& _4875, thread const int& _4876, thread const int& _4877, thread int& _4878, thread int& _4879, thread int& _4880, thread int& _4881, thread int& _4882, thread int& _4883, thread float4& gl_Position, thread float& gl_PointSize)
{
    gl_PointSize = 1.0;
    int _4886 = _4874;
    int _4888 = _4875;
    int _4890 = _4877;
    float _4892 = as_type<float>(_4875) + 0.0;
    bool _4894 = _4892 != 0.0;
    bool _4896 = isnan(_4892);
    bool _4898 = _4894 || _4896;
    bool _4900 = isnan(0.0);
    bool _4902 = _4898 || _4900;
    int _4904 = _4902 ? (-1) : 0;
    if (!_4902)
    {
        float _4906 = as_type<float>(_4875) * 1.0;
        _4886 = as_type<int>(_4906);
    }
    int _4908 = _4886;
    bool _4910 = !_4902;
    int _4912 = _4908;
    int _4914 = _4908;
    if (!_4910)
    {
        float _4916 = as_type<float>(_4875) + 0.0;
        bool _4918 = _4916 >= 0.0;
        bool _4920 = isnan(_4916);
        bool _4922 = _4918 || _4920;
        bool _4924 = isnan(0.0);
        bool _4926 = _4922 || _4924;
        _4904 = _4926 ? (-1) : 0;
        if (!_4926)
        {
            _4912 = 2147483647;
        }
        int _4928 = _4912;
        bool _4930 = !_4926;
        int _4932 = _4928;
        _4914 = _4928;
        if (!_4930)
        {
            float _4934 = abs(as_type<float>(_4875));
            float _4936 = _4934 + 0.0;
            bool _4938 = _4936 > as_type<float>(0x7f800000u /* inf */);
            bool _4940 = isnan(_4936);
            bool _4942 = _4938 || _4940;
            bool _4944 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _4946 = _4942 || _4944;
            _4904 = _4946 ? (-1) : 0;
            if (_4946)
            {
                float _4948 = as_type<float>(_4875) + 1.0;
                _4932 = as_type<int>(_4948);
            }
            int _4950 = _4932;
            int _4952 = _4950;
            _4914 = _4950;
            if (!_4946)
            {
                float _4954 = abs(as_type<float>(_4875));
                float _4956 = _4954 + (-0.0);
                float _4958 = 0.0 + _4956;
                bool _4960 = _4958 != as_type<float>(0x7f800000u /* inf */);
                bool _4962 = isnan(_4958);
                bool _4964 = _4960 || _4962;
                bool _4966 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _4968 = _4964 || _4966;
                _4904 = _4968 ? (-1) : 0;
                if (!_4968)
                {
                    _4952 = _4875;
                }
                int _4970 = _4952;
                bool _4972 = !_4968;
                _4914 = _4970;
                if (!_4972)
                {
                    float _4974 = as_type<float>(_4875) * 18446744073709551616.0;
                    float _4976 = rsqrt(_4974);
                    float _4978 = _4974 * _4976;
                    float _4980 = _4976 * 0.5;
                    float _4982 = -_4978;
                    float _4984 = 0.0 + _4982;
                    float _4986 = fma(_4980, _4984, 0.5);
                    float _4988 = fma(_4978, _4986, _4978);
                    float _4990 = -_4988;
                    float _4992 = 0.0 + _4990;
                    float _4994 = fma(_4988, _4992, _4974);
                    float _4996 = fma(_4980, _4994, _4988);
                    float _4998 = _4996 * 2.3283064365386962890625e-10;
                    _4914 = as_type<int>(_4998);
                    _4888 = as_type<int>(_4974);
                    _4890 = as_type<int>(_4984);
                }
            }
        }
    }
    int _5000 = _4914;
    int _5002 = _4888;
    int _5004 = _4890;
    int _5006 = _4904;
    _4878 = _4876;
    _4879 = 0;
    _4880 = _5000;
    _4881 = _5002;
    _4882 = _5004;
    _4883 = _5006;
}

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1362 = false;
    bool _986 = false;
    bool _291 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _87 = in.m_46.w;
    float _89 = trunc(_87);
    int _91 = int(_89);
    bool _95 = _91 >= 1;
    float _97 = 0.0;
    if (!_95)
    {
        _97 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _99 = _97;
    float _101 = _99;
    if (!_95)
    {
        out.m_49.x = 0.0;
    }
    int _103 = 0;
    if (!_95)
    {
        float _105 = _99 * 5.0;
        _103 = as_type<int>(_105);
    }
    int _107 = _103;
    int _109 = _107;
    if (!_95)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1980 = as_type<float>(_107);
        out.gl_Position.z = _1980;
    }
    if (!_95)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _111 = in.m_51.w;
    bool _113 = _111 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _115 = isnan(_111);
    bool _117 = _113 || _115;
    bool _119 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _121 = _117 || _119;
    float _123 = -_111;
    float _125 = _123 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_121)
    {
        float _127 = float(_91);
        _101 = _127;
    }
    float _129 = _101;
    bool _131 = _125 >= _129;
    bool _133 = !_121;
    bool _135 = _131 || _133;
    float _137 = _129;
    if (_135)
    {
        _137 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _139 = _137;
    if (_135)
    {
        out.m_49.x = 0.0;
    }
    if (_135)
    {
        float _141 = _139 * 5.0;
        _109 = as_type<int>(_141);
    }
    int _143 = _109;
    if (_135)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2049 = as_type<float>(_143);
        out.gl_Position.z = _2049;
    }
    if (_135)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _145 = in.m_53.x;
    float _147 = _125 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _149 = in.m_53.y;
    bool _151 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _153 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _155 = _151 || _153;
    bool _157 = isnan(1.0);
    bool _159 = _155 || _157;
    float _161 = in.m_55.w;
    float _163 = in.m_51.x;
    float _165 = in.m_51.y;
    float _167 = in.m_51.z;
    float _169 = in.m_46.x;
    float _171 = in.m_46.y;
    float _173 = in.m_46.z;
    float _175 = 0.0;
    float _177 = _147;
    if (!_159)
    {
        float _179 = _147 * _147;
        float _181 = _179 * 0.5;
        _175 = _181;
    }
    float _183 = _175;
    float _185 = _183;
    if (!_159)
    {
        float _187 = _183 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _185 = _187;
    }
    float _189 = _185;
    out.m_57.x = _145;
    out.m_57.y = _149;
    bool _191 = !_159;
    float _193 = _189;
    if (!_191)
    {
        float _195 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _197 = log2(_195);
        float _199 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _201 = _199 + 1.0;
        float _203 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _205 = _147 * _197;
        float _207 = exp2(_205);
        float _209 = _203 * 0.693147182464599609375;
        float _211 = 1.0 / _209;
        float _213 = 1.0 / _201;
        float _215 = _207 + (-1.0);
        float _217 = -_215;
        float _219 = fma(_217, _211, _147);
        float _221 = _219 * _213;
        float _223 = _221 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _193 = _223;
    }
    float _225 = _193;
    bool _227 = !_159;
    if (!_227)
    {
        float _229 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _231 = log2(_229);
        float _233 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _235 = _233 + 1.0;
        float _237 = 1.0 / _235;
        float _239 = _147 * _231;
        float _241 = exp2(_239);
        float _243 = -_241;
        float _245 = _243 + 1.0;
        float _247 = _245 * _237;
        _177 = _247;
    }
    float _249 = _177;
    bool _251 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _253 = _225 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _255 = _225 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _257 = _225 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _259 = fma(_249, _163, _253);
    float _261 = fma(_249, _165, _255);
    float _263 = fma(_249, _167, _257);
    float _265 = fma(_259, _161, _169);
    float _267 = fma(_261, _161, _171);
    float _269 = fma(_263, _161, _173);
    bool _271 = !_251;
    float _289;
    if (!_271)
    {
        float _273 = in.m_59.x;
        float _275 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _277 = _273 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _279 = fma(_277, (*spvDescriptorSet0.vp_c9)._m0[12].x, _125);
        float _281 = _279 * _275;
        float _283 = floor(_281);
        float _285 = -_283;
        float _287 = _281 + _285;
        _289 = _287;
        _291 = true;
    }
    else
    {
        float _293 = float(_91);
        float _295 = 1.0 / _293;
        float _297 = _125 * _295;
        _289 = _297;
    }
    _291 = false;
    float _299 = _289;
    int _301 = int2(spvDescriptorSet0.vp_t_tcb_C.get_width(), spvDescriptorSet0.vp_t_tcb_C.get_height()).x;
    int _303 = _301;
    int _305 = 0;
    int _307 = _82(_303, _305, (*spvDescriptorSet0.support_buffer));
    float _309 = in.m_59.x;
    float _311 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[191].y;
    float _313 = (*spvDescriptorSet0.vp_c10)._m0[2].x * 0.0166666693985462188720703125;
    float _315 = _313 * (*spvDescriptorSet0.vp_c9)._m0[191].y;
    float _317 = floor(_315);
    float _319 = fma(_317, _311, _309);
    float _321 = _319 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _323 = float(_307);
    int _325 = abs(_307);
    float _327 = _321 * _323;
    float _329 = float(uint(_325));
    int _331 = ~_325;
    int _333 = _331 + 1;
    float _335 = trunc(_327);
    int _337 = int(_335);
    float _339 = 1.0 / _329;
    int _341 = abs(_337);
    uint _344 = uint(int(uint(_337) >> uint(31)));
    float _346 = float(uint(_341));
    int _348 = ~int(_344);
    int _350 = _348 + 1;
    int _352 = as_type<int>(_339) + (-2);
    int _354 = ~_325;
    int _356 = _354 + 1;
    float _358 = as_type<float>(_352) * _346;
    float _360 = trunc(_358);
    float _362 = precise::max(_360, 0.0);
    uint _364 = uint(_362);
    int _366 = _333 * int(_364);
    int _368 = _366 + _341;
    float _370 = float(uint(_368));
    float _372 = as_type<float>(_352) * _370;
    float _374 = trunc(_372);
    float _376 = precise::max(_374, 0.0);
    uint _378 = uint(_376);
    int _380 = int(_364) + int(_378);
    int _382 = _356 * _380;
    int _384 = _382 + _341;
    bool _386 = uint(_384) >= uint(_325);
    bool _388 = !_386;
    int _390 = _388 ? 0 : (-1);
    bool _392 = _307 == 0;
    int _394 = ~_380;
    int _396 = _394 + _390;
    int _398 = _396 + 1;
    int _400 = ~_325;
    int _402 = _400 + 1;
    int _404 = _325 * _398;
    int _406 = _404 + _341;
    float _408 = in.m_53.z;
    int _410 = _406 ^ _350;
    int _412 = ~_350;
    int _414 = _412 + _410;
    int _416 = _414 + 1;
    bool _418 = !_392;
    int _420 = _418 ? _416 : (-1);
    int _422 = _420 + 1;
    int _424 = abs(_422);
    uint _426 = uint(int(uint(_422) >> uint(31)));
    float _428 = float(uint(_424));
    float _430 = trunc(_408);
    int _432 = int(_430);
    int _434 = ~int(_426);
    int _436 = _434 + 1;
    float _438 = as_type<float>(_352) * _428;
    float _440 = trunc(_438);
    float _442 = precise::max(_440, 0.0);
    uint _444 = uint(_442);
    int _446 = _402 * int(_444);
    int _448 = _446 + _424;
    float _450 = float(uint(_448));
    float _452 = as_type<float>(_352) * _450;
    int _454 = ~_325;
    int _456 = _454 + 1;
    float _458 = trunc(_452);
    float _460 = precise::max(_458, 0.0);
    uint _462 = uint(_460);
    int _464 = int(_444) + int(_462);
    int _466 = _456 * _464;
    int _468 = _466 + _424;
    bool _470 = uint(_468) >= uint(_325);
    bool _472 = !_470;
    int _474 = _472 ? 0 : (-1);
    int _476 = ~_464;
    int _478 = _476 + _474;
    int _480 = _478 + 1;
    int _482 = _325 * _480;
    int _484 = _482 + _424;
    int _486 = _484 ^ _436;
    int _488 = ~_436;
    int _490 = _488 + _486;
    int _492 = _490 + 1;
    bool _494 = !_392;
    int _496 = _494 ? _492 : (-1);
    int _498 = _420;
    int _500 = 0;
    int _502 = _83(_498, _500, (*spvDescriptorSet0.support_buffer));
    int _504 = _432;
    int _506 = 0;
    int _508 = _83(_504, _506, (*spvDescriptorSet0.support_buffer));
    float3 _512 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_502, _508)), 0).xyz;
    float _514 = _512.x;
    float _516 = _512.y;
    float _518 = _512.z;
    int _520 = _496;
    int _522 = 0;
    int _524 = _83(_520, _522, (*spvDescriptorSet0.support_buffer));
    int _526 = _432;
    int _528 = 0;
    int _530 = _83(_526, _528, (*spvDescriptorSet0.support_buffer));
    float3 _532 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_524, _530)), 0).xyz;
    float _534 = _532.x;
    float _536 = _532.y;
    float _538 = _532.z;
    float _540 = _267 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _542 = _267 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _544 = _267 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _546 = fma(_265, (*spvDescriptorSet0.vp_c10)._m0[5].x, _540);
    float _548 = fma(_265, (*spvDescriptorSet0.vp_c10)._m0[4].x, _542);
    float _550 = fma(_265, (*spvDescriptorSet0.vp_c10)._m0[6].x, _544);
    float _552 = fma(_269, (*spvDescriptorSet0.vp_c10)._m0[5].z, _546);
    float _554 = fma(_269, (*spvDescriptorSet0.vp_c10)._m0[4].z, _548);
    float _556 = fma(_269, (*spvDescriptorSet0.vp_c10)._m0[6].z, _550);
    float _558 = _552 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _560 = _554 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _562 = _299 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _564 = isnan(_299);
    bool _566 = _562 || _564;
    bool _568 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _570 = _566 || _568;
    float _572 = float(_570);
    float _574 = -_558;
    float _576 = _574 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _578 = _556 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _580 = -_560;
    float _582 = _580 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _584 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _586 = _558 + _584;
    float _588 = _576 * _576;
    float _590 = -_578;
    float _592 = _590 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _594 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _596 = _560 + _594;
    float _598 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _600 = _578 + _598;
    float _602 = fma(_582, _582, _588);
    float _604 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _606 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _604;
    float _608 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _610 = _608 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _612 = fma(_592, _592, _602);
    float _614 = rsqrt(_612);
    float _616 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _618 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _616;
    float _620 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _622 = _620 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _624 = 1.0 / _618;
    float _626 = _592 * _614;
    float _628 = _576 * _614;
    float _630 = _582 * _614;
    float _632 = 1.0 / _622;
    float _634 = _626 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _636 = _628 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _638 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _640 = _299 + _638;
    float _642 = -_634;
    float _644 = fma(_630, (*spvDescriptorSet0.vp_c10)._m0[10].y, _642);
    float _646 = -_636;
    float _648 = fma(_626, (*spvDescriptorSet0.vp_c10)._m0[9].y, _646);
    float _650 = _630 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _652 = _640 * _624;
    float _654 = _644 * _644;
    float _656 = _586 * _586;
    float _658 = -_650;
    float _660 = fma(_628, (*spvDescriptorSet0.vp_c10)._m0[8].y, _658);
    float _662 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _664 = _299 + _662;
    float _666 = fma(_648, _648, _654);
    float _668 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _670 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _668;
    float _672 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _674 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _672;
    float _676 = _664 * _632;
    float _678 = fma(_660, _660, _666);
    float _680 = fma(_596, _596, _656);
    float _682 = fma(_670, _652, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _684 = fma(_674, _652, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _686 = fma(_606, _652, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _688 = fma(_600, _600, _680);
    float _690 = rsqrt(_678);
    float _692 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _694 = _692 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _696 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _698 = _696 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _700 = fma(_610, _676, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _702 = fma(_694, _676, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _704 = fma(_698, _676, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _706 = rsqrt(_688);
    float _708 = _648 * _690;
    float _710 = _660 * _690;
    float _712 = _644 * _690;
    float _714 = _708 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _716 = _710 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _718 = _712 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _720 = -_714;
    float _722 = fma(_710, (*spvDescriptorSet0.vp_c10)._m0[8].y, _720);
    float _724 = -_716;
    float _726 = fma(_712, (*spvDescriptorSet0.vp_c10)._m0[10].y, _724);
    float _728 = -_718;
    float _730 = fma(_708, (*spvDescriptorSet0.vp_c10)._m0[9].y, _728);
    bool _732 = _299 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _734 = isnan(_299);
    bool _736 = _732 || _734;
    bool _738 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _740 = _736 || _738;
    float _742 = float(_740);
    float _744 = _586 * _706;
    float _746 = _722 * _722;
    bool _748 = _299 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _750 = isnan(_299);
    bool _752 = _748 || _750;
    bool _754 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _756 = _752 || _754;
    float _758 = float(_756);
    float _760 = _596 * _706;
    float _762 = -_744;
    float _764 = fma(_762, (*spvDescriptorSet0.vp_c9)._m0[18].w, _586);
    float _766 = -_742;
    float _768 = _766 + 1.0;
    float _770 = fma(_726, _726, _746);
    float _772 = -_760;
    float _774 = fma(_772, (*spvDescriptorSet0.vp_c9)._m0[18].w, _596);
    float _776 = _764 * _764;
    float _778 = _758 * _768;
    float _780 = -_758;
    float _782 = _780 + 1.0;
    float _784 = fma(_730, _730, _770);
    float _786 = in.m_55.x;
    float _788 = in.m_55.y;
    float _790 = in.m_55.z;
    float _792 = _600 * _706;
    float _794 = _572 * _782;
    float _796 = fma(_774, _774, _776);
    float _798 = -_572;
    float _800 = _798 + 1.0;
    float _802 = -_792;
    float _804 = fma(_802, (*spvDescriptorSet0.vp_c9)._m0[18].w, _600);
    float _806 = rsqrt(_784);
    float _808 = _682 * _794;
    float _810 = _684 * _794;
    float _812 = _686 * _794;
    float _814 = fma(_804, _804, _796);
    float _816 = fma(_800, (*spvDescriptorSet0.vp_c9)._m0[143].x, _808);
    float _818 = fma(_800, (*spvDescriptorSet0.vp_c9)._m0[143].y, _810);
    float _820 = fma(_800, (*spvDescriptorSet0.vp_c9)._m0[143].z, _812);
    float _822 = floor(_327);
    float _824 = fma(_704, _778, _816);
    float _826 = fma(_702, _778, _818);
    float _828 = fma(_700, _778, _820);
    float _830 = fma(_742, (*spvDescriptorSet0.vp_c9)._m0[145].x, _824);
    float _832 = fma(_742, (*spvDescriptorSet0.vp_c9)._m0[145].y, _826);
    float _834 = fma(_742, (*spvDescriptorSet0.vp_c9)._m0[145].z, _828);
    float _836 = sqrt(_814);
    float _838 = _722 * _806;
    float _840 = _832 * _788;
    float _842 = _726 * _806;
    float _844 = _730 * _806;
    float _846 = _838 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _848 = _840 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _850 = _830 * _786;
    float _852 = -_822;
    float _854 = _327 + _852;
    float _856 = fma(_842, (*spvDescriptorSet0.vp_c10)._m0[8].z, _846);
    float _858 = _834 * _790;
    float _860 = _850 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _862 = fma(_844, (*spvDescriptorSet0.vp_c10)._m0[10].z, _856);
    float _864 = _858 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _866 = _706 * _836;
    float _868 = abs(_862);
    float _870 = -_868;
    float _872 = _870 + 1.0;
    float _874 = _848 * _866;
    float _876 = _860 * _866;
    float _878 = _864 * _866;
    float _880 = -_516;
    float _882 = _880 + _536;
    float _884 = -_514;
    float _886 = _884 + _534;
    float _888 = -_518;
    float _890 = _888 + _538;
    int _892 = as_type<int>(_872) + (-218103808);
    float _894 = fma(_854, _882, _516);
    float _896 = fma(_854, _886, _514);
    float _898 = fma(_854, _890, _518);
    bool _900 = uint(_892) >= 1920991232u;
    float _902 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _894);
    float _904 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _896);
    float _906 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _898);
    out.m_61.y = _894;
    float _908 = _874 * _902;
    float _910 = _876 * _904;
    float _912 = _878 * _906;
    float _914 = _908 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _916 = _908 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _918 = _908 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _920 = fma(_910, (*spvDescriptorSet0.vp_c10)._m0[8].x, _914);
    float _922 = fma(_910, (*spvDescriptorSet0.vp_c10)._m0[9].x, _916);
    float _924 = fma(_910, (*spvDescriptorSet0.vp_c10)._m0[10].x, _918);
    float _926 = abs(_862);
    float _928 = fma(_926, -0.0187292993068695068359375, 0.074261002242565155029296875);
    float _930 = fma(_912, (*spvDescriptorSet0.vp_c10)._m0[8].z, _920);
    float _932 = fma(_912, (*spvDescriptorSet0.vp_c10)._m0[9].z, _922);
    float _934 = fma(_912, (*spvDescriptorSet0.vp_c10)._m0[10].z, _924);
    float _936 = abs(_862);
    float _938 = fma(_936, _928, -0.212114393711090087890625);
    float _940 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _942 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _944 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _946 = abs(_862);
    float _948 = fma(_946, _938, 1.570728778839111328125);
    float _950 = _940 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _952 = _942 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _954 = _944 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _956 = _862 < 0.0;
    float _958 = float(_956);
    bool _960 = !_900;
    float _962 = _930;
    float _984;
    if (!_960)
    {
        int _964 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[107].z);
        int _966 = as_type<int>(_872);
        int _968 = 4960;
        int _970 = as_type<int>(_922);
        int _972;
        int _974;
        int _976;
        int _978;
        int _980;
        int _982;
        _80(_964, _966, _968, _970, _972, _974, _976, _978, _980, _982, out.gl_Position, out.gl_PointSize);
        _984 = as_type<float>(_976);
        _986 = true;
    }
    else
    {
        float _988 = rsqrt(_872);
        float _990 = _872 * _988;
        float _992 = _988 * 0.5;
        float _994 = -_990;
        float _996 = 0.0 + _994;
        float _998 = fma(_992, _996, 0.5);
        float _1000 = fma(_990, _998, _990);
        float _1002 = -_1000;
        float _1004 = 0.0 + _1002;
        float _1006 = fma(_1000, _1004, _872);
        float _1008 = fma(_992, _1006, _1000);
        _984 = _1008;
    }
    _986 = false;
    float _1010 = _984;
    float _1012 = _844 * (*spvDescriptorSet0.vp_c10)._m0[8].z;
    float _1014 = _838 * (*spvDescriptorSet0.vp_c10)._m0[10].z;
    float _1016 = _948 * _1010;
    float _1018 = -_1012;
    float _1020 = fma(_842, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1018);
    float _1022 = _842 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _1024 = -_1014;
    float _1026 = fma(_844, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1024);
    float _1028 = _1020 * _1020;
    float _1030 = -_1022;
    float _1032 = fma(_838, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1030);
    float _1034 = -(*spvDescriptorSet0.vp_c9)._m0[192].y;
    float _1036 = (*spvDescriptorSet0.vp_c10)._m0[8].w + _1034;
    float _1038 = fma(_1026, _1026, _1028);
    float _1040 = _958 * 2.0;
    float _1042 = -(*spvDescriptorSet0.vp_c9)._m0[192].w;
    float _1044 = (*spvDescriptorSet0.vp_c10)._m0[10].w + _1042;
    float _1046 = fma(_1032, _1032, _1038);
    float _1048 = -_1040;
    float _1050 = fma(_1016, _1048, _1016);
    float _1052 = rsqrt(_1046);
    float _1054 = fma(_958, 3.1415927410125732421875, _1050);
    float _1056 = _1054 * 0.15915493667125701904296875;
    float _1058 = _1056 * 6.283185482025146484375;
    float _1060 = cos(_1058);
    float _1062 = _1020 * _1052;
    float _1064 = _1026 * _1052;
    float _1066 = _1032 * _1052;
    float _1068 = _1062 * _1062;
    float _1070 = fma(_1064, _1064, _1068);
    float _1072 = fma(_1066, _1066, _1070);
    float _1074 = -(*spvDescriptorSet0.vp_c9)._m0[192].z;
    float _1076 = (*spvDescriptorSet0.vp_c10)._m0[9].w + _1074;
    float _1078 = -_1036;
    float _1080 = _1078 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1082 = -_1076;
    float _1084 = _1082 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1086 = rsqrt(_1072);
    float _1088 = _1084 * _1084;
    float _1090 = fma(_1080, _1080, _1088);
    float _1092 = _1056 * 6.283185482025146484375;
    float _1094 = sin(_1092);
    float _1096 = -_1044;
    float _1098 = _1096 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1100 = fma(_1098, _1098, _1090);
    float _1102 = -_1060;
    float _1104 = _1102 + 1.0;
    float _1106 = _1064 * _1086;
    float _1108 = _1062 * _1086;
    float _1110 = _1066 * _1086;
    float _1112 = sqrt(_1100);
    float _1114 = _1106 * _1104;
    float _1116 = _1108 * _1104;
    float _1118 = _1110 * _1110;
    float _1120 = _1110 * _1094;
    float _1122 = _1106 * _1094;
    float _1124 = _1108 * _1094;
    float _1126 = fma(_1106, _1114, _1060);
    float _1128 = -_1120;
    float _1130 = fma(_1108, _1114, _1128);
    float _1132 = fma(_1110, _1116, _1122);
    float _1134 = -_1124;
    float _1136 = fma(_1110, _1114, _1134);
    float _1138 = fma(_1104, _1118, _1060);
    float _1140 = _932 * _1130;
    float _1142 = _932 * _1132;
    float _1144 = fma(_1110, _1114, _1124);
    float _1146 = fma(_1112, 0.0068421051837503910064697265625, 0.3157894611358642578125);
    float _1148 = fma(_930, _1126, _1140);
    float _1150 = fma(_930, _1136, _1142);
    float _1152 = fma(_1108, _1116, _1060);
    float _1154 = fma(_1108, _1114, _1120);
    float _1156 = fma(_934, _1144, _1148);
    float _1158 = fma(_934, _1138, _1150);
    float _1160 = precise::max(_1146, 0.3499999940395355224609375);
    float _1162 = _932 * _1152;
    float _1164 = _560 + _1156;
    float _1166 = _578 + _1158;
    float _1168 = precise::min(_1160, 1.0);
    float _1170 = -_1122;
    float _1172 = fma(_1110, _1116, _1170);
    float _1174 = -_1036;
    float _1176 = _1164 + _1174;
    float _1178 = -_1044;
    float _1180 = _1166 + _1178;
    float _1182 = fma(_930, _1154, _1162);
    float _1184 = fma(_1176, _1168, _1036);
    float _1186 = fma(_1180, _1168, _1044);
    float _1188 = fma(_934, _1172, _1182);
    float _1190 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1192 = _1184 + _1190;
    float _1194 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1196 = _1186 + _1194;
    float _1198 = _558 + _1188;
    float _1200 = _1192 * _1192;
    float _1202 = _1196 * _1196;
    float _1204 = -_1076;
    float _1206 = _1198 + _1204;
    float _1208 = _1200 + _1202;
    float _1210 = fma(_1206, _1168, _1076);
    float _1212 = sqrt(_1208);
    bool _1214 = _1212 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1216 = _1152;
    float _1218 = _1076;
    float _1220 = _1182;
    float _1222 = _1206;
    float _1224 = _1154;
    float _1226 = _1192;
    float _1228 = _1114;
    if (!_1214)
    {
        _1216 = _1202;
    }
    float _1230 = _1216;
    float _1232 = _1230;
    if (!_1214)
    {
        _962 = _1200;
    }
    float _1234 = _962;
    float _1236 = _1234;
    if (!_1214)
    {
        _1218 = _1184;
    }
    float _1238 = _1218;
    float _1240 = _1238;
    if (!_1214)
    {
        _1220 = _1186;
    }
    float _1242 = _1220;
    float _1244 = _1242;
    if (!_1214)
    {
        _1222 = _1210;
    }
    float _1246 = _1222;
    bool _1248 = !_1214;
    float _1250 = _1246;
    if (!_1248)
    {
        float _1252 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1254 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1256 = _1212 + _1254;
        float _1258 = _1210 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1260 = rsqrt(_1208);
        float _1262 = _1256 * _1252;
        float _1264 = _1262 * 0.15915493667125701904296875;
        float _1266 = _1264 * 6.283185482025146484375;
        float _1268 = sin(_1266);
        float _1270 = _1264 * 6.283185482025146484375;
        float _1272 = cos(_1270);
        float _1274 = fma(_1268, _1258, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1276 = _1260 * _1274;
        float _1278 = _1272 + (-1.0);
        float _1280 = _1278 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1282 = _1192 * _1276;
        float _1284 = _1196 * _1276;
        float _1286 = fma(_1210, _1272, _1280);
        float _1288 = _1282 + (*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1290 = _1284 + (*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1292 = _1282 * _1282;
        float _1294 = _1284 * _1284;
        _1250 = _1286;
        _1236 = _1292;
        _1232 = _1294;
        _1240 = _1288;
        _1244 = _1290;
    }
    float _1296 = _1250;
    float _1298 = _1236;
    float _1300 = _1232;
    float _1302 = _1240;
    float _1304 = _1244;
    float _1306 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1308 = _1296 + _1306;
    out.m_63.x = _950;
    out.m_63.y = _952;
    out.m_63.z = _954;
    float _1310 = fma(_1308, _1308, _1298);
    float _1312 = _1310 + _1300;
    float _1314 = sqrt(_1312);
    bool _1316 = _1314 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1318 = isnan(_1314);
    bool _1320 = _1316 || _1318;
    bool _1322 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1324 = _1320 || _1322;
    float _1326 = _1298;
    if (!_1324)
    {
        _1326 = 1.0;
    }
    float _1328 = _1326;
    bool _1330 = !_1324;
    float _1332 = _1328;
    if (!_1330)
    {
        bool _1334 = _1314 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1336 = isnan(_1314);
        bool _1338 = _1334 || _1336;
        bool _1340 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1342 = _1338 || _1340;
        if (!_1342)
        {
            float _1344 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1346 = _1314 + _1344;
            float _1348 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1350 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1348;
            float _1352 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1354 = _1352 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1356 = 1.0 / _1350;
            float _1358 = _1346 * _1356;
            float _1360 = fma(_1358, _1354, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1332 = _1360;
            _1362 = true;
        }
        else
        {
            bool _1364 = _1314 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1366 = isnan(_1314);
            bool _1368 = _1364 || _1366;
            bool _1370 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1372 = _1368 || _1370;
            if (!_1372)
            {
                float _1374 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1376 = _1314 + _1374;
                float _1378 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1380 = _1378 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1382 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1384 = _1382 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1386 = 1.0 / _1380;
                float _1388 = _1376 * _1386;
                float _1390 = fma(_1388, _1384, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1332 = _1390;
                _1362 = true;
            }
            else
            {
                _1332 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1362 = false;
    float _1392 = _1332;
    float _1394 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1396 = _1296 + _1394;
    float _1398 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1400 = _1302 + _1398;
    float _1402 = fma(_1396, _1392, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1404 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1406 = _1304 + _1404;
    float _1408 = fma(_1400, _1392, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1410 = -_744;
    float _1412 = fma(_1410, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1402);
    float _1414 = fma(_1406, _1392, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1416 = -_760;
    float _1418 = fma(_1416, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1408);
    float _1420 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1422 = _1412 + _1420;
    float _1424 = -_792;
    float _1426 = fma(_1424, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1414);
    float _1428 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1430 = _1418 + _1428;
    float _1432 = _1422 * _1422;
    float _1434 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1436 = _1426 + _1434;
    float _1438 = fma(_1430, _1430, _1432);
    float _1440 = fma(_1436, _1436, _1438);
    float _1442 = rsqrt(_1440);
    float _1444 = _1442 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1446 = _1430 * _1444;
    float _1448 = _1436 * _1444;
    float _1450 = _1446 * _1446;
    float _1452 = _1448 * _1448;
    float _1454 = _1450 + _1452;
    float _1456 = sqrt(_1454);
    bool _1458 = _1456 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1460 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1462 = _1456 + _1460;
    float _1464 = _1436;
    float _1466 = _1454;
    float _1468 = _1462;
    float _1470 = _1446;
    if (_1458)
    {
        float _1472 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1464 = _1472;
    }
    float _1474 = _1464;
    if (_1458)
    {
        float _1476 = rsqrt(_1454);
        _1466 = _1476;
    }
    float _1478 = _1466;
    float _1480 = _1478;
    if (_1458)
    {
        float _1482 = _1462 * _1474;
        _1468 = _1482;
    }
    float _1484 = _1468;
    if (_1458)
    {
        float _1486 = _1484 * 0.15915493667125701904296875;
        _1224 = _1486;
    }
    float _1488 = _1224;
    float _1490 = _1442;
    if (_1458)
    {
        float _1492 = _1488 * 6.283185482025146484375;
        float _1494 = sin(_1492);
        _1490 = _1494;
    }
    float _1496 = _1490;
    float _1498 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1500 = precise::max(0.0, _1498);
    float _1502 = _1310;
    float _1504 = _1500;
    float _1506 = _1498;
    if (_1458)
    {
        float _1508 = _1488 * 6.283185482025146484375;
        float _1510 = cos(_1508);
        _1502 = _1510;
    }
    float _1512 = _1502;
    float _1514 = -_1444;
    float _1516 = -_1500;
    float _1518 = fma(_1422, _1514, _1516);
    if (_1458)
    {
        float _1520 = _1518 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1504 = _1520;
    }
    float _1522 = _1504;
    float _1524 = sqrt(_1440);
    float _1526 = _1496;
    float _1528 = _1522;
    if (_1458)
    {
        float _1530 = fma(_1496, _1522, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1526 = _1530;
    }
    float _1532 = _1526;
    float _1534 = _1532;
    if (!_1458)
    {
        _1528 = _1448;
    }
    float _1536 = _1528;
    float _1538 = _1536;
    if (_1458)
    {
        float _1540 = _1512 + (-1.0);
        _1506 = _1540;
    }
    float _1542 = _1506;
    float _1544 = _1542;
    if (_1458)
    {
        float _1546 = _1478 * _1532;
        _1226 = _1546;
    }
    float _1548 = _1226;
    if (!_1458)
    {
        _1534 = _1518;
    }
    float _1550 = _1534;
    float _1552 = _1550;
    if (_1458)
    {
        float _1554 = _1542 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1228 = _1554;
    }
    float _1556 = _1228;
    if (_1458)
    {
        float _1558 = _1446 * _1548;
        _1470 = _1558;
    }
    float _1560 = _1470;
    if (!_1458)
    {
        _1480 = _1450;
    }
    float _1562 = _1480;
    float _1564 = _1562;
    if (_1458)
    {
        float _1566 = _1448 * _1548;
        _1538 = _1566;
    }
    float _1568 = _1538;
    if (_1458)
    {
        float _1570 = fma(_1518, _1512, _1556);
        _1552 = _1570;
    }
    float _1572 = _1552;
    if (_1458)
    {
        float _1574 = _1560 * _1560;
        _1564 = _1574;
    }
    float _1576 = _1564;
    if (!_1458)
    {
        _1544 = _1452;
    }
    float _1578 = _1544;
    float _1580 = _1578;
    if (_1458)
    {
        float _1582 = _1568 * _1568;
        _1580 = _1582;
    }
    float _1584 = _1580;
    float _1586 = fma(_1572, _1572, _1576);
    float _1588 = _1586 + _1584;
    float _1590 = _1412 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1592 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1594 = fma(_1524, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1592);
    float _1596 = precise::clamp(_1594, 0.0, 1.0);
    float _1598 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1600 = rsqrt(_1588);
    float _1602 = fma(_1418, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1590);
    float _1604 = _1412 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1606 = -_1596;
    float _1608 = _1606 + 1.0;
    float _1610 = _1412 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1612 = fma(_1426, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1602);
    float _1614 = fma(_1418, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1604);
    float _1616 = _1412 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1618 = fma(_1418, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1610);
    float _1620 = _1612 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1622 = fma(_1426, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1614);
    float _1624 = abs(_1608);
    float _1626 = log2(_1624);
    float _1628 = fma(_1426, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1618);
    float _1630 = _1620 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1632 = fma(_1418, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1616);
    float _1634 = _1622 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1636 = _1600 * _1560;
    float _1638 = -_1630;
    float _1640 = fma(_1638, _1598, 1.0);
    float _1642 = _1628 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1644 = _1600 * _1572;
    float _1646 = _1636 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1648 = fma(_1426, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1632);
    float _1650 = _1634 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1652 = _1600 * _1568;
    float _1654 = -_1646;
    float _1656 = fma(_1644, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1654);
    float _1658 = _1648 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1660 = fma(_1642, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1650);
    float _1662 = _1626 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1664 = -_1652;
    float _1666 = fma(_1664, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1656);
    float _1668 = log2(_1640);
    float _1670 = fma(_1620, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1660);
    float _1672 = _1634 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1674 = fma(_1666, -0.5, 0.5);
    float _1676 = _1634 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1678 = fma(_1658, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1670);
    float _1680 = fma(_1666, 0.5, 0.5);
    float _1682 = fma(_1642, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1672);
    float _1684 = exp2(_1662);
    float _1686 = fma(_1642, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1676);
    float _1688 = _1644 + 1.0;
    float _1690 = fma(_1680, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1692 = fma(_1620, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1682);
    float _1694 = fma(_1620, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1686);
    float _1696 = fma(_1680, _1690, -0.212114393711090087890625);
    float _1698 = 1.0 / _1678;
    float _1700 = fma(_1658, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1694);
    float _1702 = _1668 * 0.693147182464599609375;
    float _1704 = fma(_1680, _1696, 1.570728778839111328125);
    float _1706 = _1702 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1708 = sqrt(_1674);
    float _1710 = -_1644;
    float _1712 = fma(_1684, _1688, _1710);
    float _1714 = fma(_1658, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1692);
    float _1716 = fma(_1712, 0.5, 0.5);
    float _1718 = _1714 * _1698;
    float _1720 = _1700 * _1698;
    float _1722 = fma(_1718, 0.5, 0.5);
    float _1724 = fma(_1720, -0.5, 0.5);
    float _1726 = _1708 * 0.636619746685028076171875;
    float _1728 = -_1704;
    float _1730 = fma(_1726, _1728, 1.0);
    float3 _4539 = float3(_1722, _1724, _1706);
    float _1732 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4539, float3(0.0), isnan(_4539)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4539, float3(0.0), isnan(_4539)), level(0.0)).x;
    float3 _4550 = float3(_1722, _1724, _1706);
    float4 _1735 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4550, float3(0.0), isnan(_4550)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4550, float3(0.0), isnan(_4550)), level(0.0)).xyzw;
    float _1737 = _1735.x;
    float _1739 = _1735.y;
    float _1741 = _1735.z;
    float _1743 = _1735.w;
    float2 _4567 = float2(_1730, _1716);
    float3 _1745 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4567, float2(0.0), isnan(_4567)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4567, float2(0.0), isnan(_4567)), level(0.0)).xyz;
    float _1747 = _1745.x;
    float _1749 = _1745.y;
    float _1751 = _1745.z;
    float _1753 = -_744;
    float _1755 = fma(_1753, (*spvDescriptorSet0.vp_c9)._m0[18].w, _558);
    float _1757 = -_760;
    float _1759 = fma(_1757, (*spvDescriptorSet0.vp_c9)._m0[18].w, _560);
    float _1761 = -_792;
    float _1763 = fma(_1761, (*spvDescriptorSet0.vp_c9)._m0[18].w, _578);
    float _1765 = _1755 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1767 = fma(_1759, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1765);
    float _1769 = _1755 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1771 = fma(_1763, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1767);
    float _1773 = fma(_1759, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1769);
    float _1775 = _1626 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _1777 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1779 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1781 = _1777 || _1779;
    bool _1783 = isnan(0.5);
    bool _1785 = _1781 || _1783;
    float _1787 = _1771 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1789 = fma(_1763, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1773);
    float _1791 = _1634 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1793 = exp2(_1775);
    float _1795 = _1789 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1797 = fma(_1642, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1791);
    float _1799 = _1795 + _1787;
    float _1801 = fma(_1620, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1797);
    float _1803 = 1.0 / _1787;
    float _1805 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    if (_1785)
    {
        _1805 = 1.0;
    }
    float _1807 = _1805;
    float _1809 = fma(_1658, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1801);
    float _1811 = _1799 * _1803;
    float _1813 = _1811 * 0.5;
    float _1815 = _1807;
    if (!_1785)
    {
        float _1817 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1819 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1821 = fma(_1813, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1819);
        float _1823 = _1817 * 0.15915493667125701904296875;
        float _1825 = _1823 * 6.283185482025146484375;
        float _1827 = cos(_1825);
        float _1829 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1831 = _1829 * 0.15915493667125701904296875;
        float _1833 = _1823 * 6.283185482025146484375;
        float _1835 = sin(_1833);
        float _1837 = 1.0 / _1827;
        float _1839 = _1831 * 6.283185482025146484375;
        float _1841 = cos(_1839);
        float _1843 = _1835 * _1837;
        float _1845 = 1.0 / _1821;
        float _1847 = _1841 * _1843;
        float _1849 = _1831 * 6.283185482025146484375;
        float _1851 = sin(_1849);
        float _1853 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1855 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1853;
        float _1857 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1859 = _1845 * _1857;
        float _1861 = 1.0 / _1847;
        float _1863 = 1.0 / _1855;
        float _1865 = _1851 * _1861;
        float _1867 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1869 = fma(_1865, _1859, _1867);
        float _1871 = _1869 * _1863;
        float _1873 = precise::clamp(_1871, 0.0, 1.0);
        float _1875 = -_1873;
        float _1877 = _1875 + 1.0;
        _1815 = _1877;
    }
    float _1879 = _1815;
    float _1881 = _1809 + _1678;
    float _1883 = -_1793;
    float _1885 = _1883 + 1.0;
    bool _1887 = _1879 > 0.0;
    bool _1889 = isnan(_1879);
    bool _1891 = _1887 || _1889;
    bool _1893 = isnan(0.0);
    bool _1895 = _1891 || _1893;
    float _1897 = _1879 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1899 = _1881 * 0.5;
    float _1901 = _1885 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1903 = _1897 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1905 = _1901 * _1732;
    float _1907 = -_1901;
    float _1909 = _1907 + 1.0;
    out.gl_Position.x = _1714;
    out.gl_Position.y = _1700;
    out.gl_Position.z = _1809;
    out.gl_Position.w = _1678;
    float _1911 = _1743 * _1905;
    float _1913 = _1751 * _1905;
    out.m_65.z = _1899;
    out.m_65.w = _1678;
    float _1915 = fma(_1747, _1911, _1737);
    float _1917 = fma(_1749, _1911, _1739);
    float _1919 = _1743 * _1909;
    float _1921 = fma(_1743, _1913, _1741);
    out.m_49.x = _1903;
    out.m_67.x = _1915;
    out.m_67.y = _1917;
    out.m_67.z = _1921;
    out.m_67.w = _1919;
    if (_1895)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_49.x = 0.0;
    float _1923 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1923;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1362 = false;
    bool _986 = false;
    bool _291 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _87 = in.m_46.w;
    float _89 = trunc(_87);
    int _91 = int(_89);
    bool _95 = _91 >= 1;
    float _97 = 0.0;
    if (!_95)
    {
        _97 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _99 = _97;
    float _101 = _99;
    if (!_95)
    {
        out.m_49.x = 0.0;
    }
    int _103 = 0;
    if (!_95)
    {
        float _105 = _99 * 5.0;
        _103 = as_type<int>(_105);
    }
    int _107 = _103;
    int _109 = _107;
    if (!_95)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1980 = as_type<float>(_107);
        out.gl_Position.z = _1980;
    }
    if (!_95)
    {
        return out;
    }
    float _111 = in.m_51.w;
    bool _113 = _111 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _115 = isnan(_111);
    bool _117 = _113 || _115;
    bool _119 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _121 = _117 || _119;
    float _123 = -_111;
    float _125 = _123 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_121)
    {
        float _127 = float(_91);
        _101 = _127;
    }
    float _129 = _101;
    bool _131 = _125 >= _129;
    bool _133 = !_121;
    bool _135 = _131 || _133;
    float _137 = _129;
    if (_135)
    {
        _137 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _139 = _137;
    if (_135)
    {
        out.m_49.x = 0.0;
    }
    if (_135)
    {
        float _141 = _139 * 5.0;
        _109 = as_type<int>(_141);
    }
    int _143 = _109;
    if (_135)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2049 = as_type<float>(_143);
        out.gl_Position.z = _2049;
    }
    if (_135)
    {
        return out;
    }
    float _145 = in.m_53.x;
    float _147 = _125 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _149 = in.m_53.y;
    bool _151 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _153 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _155 = _151 || _153;
    bool _157 = isnan(1.0);
    bool _159 = _155 || _157;
    float _161 = in.m_55.w;
    float _163 = in.m_51.x;
    float _165 = in.m_51.y;
    float _167 = in.m_51.z;
    float _169 = in.m_46.x;
    float _171 = in.m_46.y;
    float _173 = in.m_46.z;
    float _175 = 0.0;
    float _177 = _147;
    if (!_159)
    {
        float _179 = _147 * _147;
        float _181 = _179 * 0.5;
        _175 = _181;
    }
    float _183 = _175;
    float _185 = _183;
    if (!_159)
    {
        float _187 = _183 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _185 = _187;
    }
    float _189 = _185;
    out.m_57.x = _145;
    out.m_57.y = _149;
    bool _191 = !_159;
    float _193 = _189;
    if (!_191)
    {
        float _195 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _197 = log2(_195);
        float _199 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _201 = _199 + 1.0;
        float _203 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _205 = _147 * _197;
        float _207 = exp2(_205);
        float _209 = _203 * 0.693147182464599609375;
        float _211 = 1.0 / _209;
        float _213 = 1.0 / _201;
        float _215 = _207 + (-1.0);
        float _217 = -_215;
        float _219 = fma(_217, _211, _147);
        float _221 = _219 * _213;
        float _223 = _221 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _193 = _223;
    }
    float _225 = _193;
    bool _227 = !_159;
    if (!_227)
    {
        float _229 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _231 = log2(_229);
        float _233 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _235 = _233 + 1.0;
        float _237 = 1.0 / _235;
        float _239 = _147 * _231;
        float _241 = exp2(_239);
        float _243 = -_241;
        float _245 = _243 + 1.0;
        float _247 = _245 * _237;
        _177 = _247;
    }
    float _249 = _177;
    bool _251 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _253 = _225 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _255 = _225 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _257 = _225 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _259 = fma(_249, _163, _253);
    float _261 = fma(_249, _165, _255);
    float _263 = fma(_249, _167, _257);
    float _265 = fma(_259, _161, _169);
    float _267 = fma(_261, _161, _171);
    float _269 = fma(_263, _161, _173);
    bool _271 = !_251;
    float _289;
    if (!_271)
    {
        float _273 = in.m_59.x;
        float _275 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _277 = _273 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _279 = fma(_277, (*spvDescriptorSet0.vp_c9)._m0[12].x, _125);
        float _281 = _279 * _275;
        float _283 = floor(_281);
        float _285 = -_283;
        float _287 = _281 + _285;
        _289 = _287;
        _291 = true;
    }
    else
    {
        float _293 = float(_91);
        float _295 = 1.0 / _293;
        float _297 = _125 * _295;
        _289 = _297;
    }
    _291 = false;
    float _299 = _289;
    int _301 = int2(spvDescriptorSet0.vp_t_tcb_C.get_width(), spvDescriptorSet0.vp_t_tcb_C.get_height()).x;
    int _303 = _301;
    int _305 = 0;
    int _307 = _82(_303, _305, (*spvDescriptorSet0.support_buffer));
    float _309 = in.m_59.x;
    float _311 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[191].y;
    float _313 = (*spvDescriptorSet0.vp_c10)._m0[2].x * 0.0166666693985462188720703125;
    float _315 = _313 * (*spvDescriptorSet0.vp_c9)._m0[191].y;
    float _317 = floor(_315);
    float _319 = fma(_317, _311, _309);
    float _321 = _319 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _323 = float(_307);
    int _325 = abs(_307);
    float _327 = _321 * _323;
    float _329 = float(uint(_325));
    int _331 = ~_325;
    int _333 = _331 + 1;
    float _335 = trunc(_327);
    int _337 = int(_335);
    float _339 = 1.0 / _329;
    int _341 = abs(_337);
    uint _344 = uint(int(uint(_337) >> uint(31)));
    float _346 = float(uint(_341));
    int _348 = ~int(_344);
    int _350 = _348 + 1;
    int _352 = as_type<int>(_339) + (-2);
    int _354 = ~_325;
    int _356 = _354 + 1;
    float _358 = as_type<float>(_352) * _346;
    float _360 = trunc(_358);
    float _362 = precise::max(_360, 0.0);
    uint _364 = uint(_362);
    int _366 = _333 * int(_364);
    int _368 = _366 + _341;
    float _370 = float(uint(_368));
    float _372 = as_type<float>(_352) * _370;
    float _374 = trunc(_372);
    float _376 = precise::max(_374, 0.0);
    uint _378 = uint(_376);
    int _380 = int(_364) + int(_378);
    int _382 = _356 * _380;
    int _384 = _382 + _341;
    bool _386 = uint(_384) >= uint(_325);
    bool _388 = !_386;
    int _390 = _388 ? 0 : (-1);
    bool _392 = _307 == 0;
    int _394 = ~_380;
    int _396 = _394 + _390;
    int _398 = _396 + 1;
    int _400 = ~_325;
    int _402 = _400 + 1;
    int _404 = _325 * _398;
    int _406 = _404 + _341;
    float _408 = in.m_53.z;
    int _410 = _406 ^ _350;
    int _412 = ~_350;
    int _414 = _412 + _410;
    int _416 = _414 + 1;
    bool _418 = !_392;
    int _420 = _418 ? _416 : (-1);
    int _422 = _420 + 1;
    int _424 = abs(_422);
    uint _426 = uint(int(uint(_422) >> uint(31)));
    float _428 = float(uint(_424));
    float _430 = trunc(_408);
    int _432 = int(_430);
    int _434 = ~int(_426);
    int _436 = _434 + 1;
    float _438 = as_type<float>(_352) * _428;
    float _440 = trunc(_438);
    float _442 = precise::max(_440, 0.0);
    uint _444 = uint(_442);
    int _446 = _402 * int(_444);
    int _448 = _446 + _424;
    float _450 = float(uint(_448));
    float _452 = as_type<float>(_352) * _450;
    int _454 = ~_325;
    int _456 = _454 + 1;
    float _458 = trunc(_452);
    float _460 = precise::max(_458, 0.0);
    uint _462 = uint(_460);
    int _464 = int(_444) + int(_462);
    int _466 = _456 * _464;
    int _468 = _466 + _424;
    bool _470 = uint(_468) >= uint(_325);
    bool _472 = !_470;
    int _474 = _472 ? 0 : (-1);
    int _476 = ~_464;
    int _478 = _476 + _474;
    int _480 = _478 + 1;
    int _482 = _325 * _480;
    int _484 = _482 + _424;
    int _486 = _484 ^ _436;
    int _488 = ~_436;
    int _490 = _488 + _486;
    int _492 = _490 + 1;
    bool _494 = !_392;
    int _496 = _494 ? _492 : (-1);
    int _498 = _420;
    int _500 = 0;
    int _502 = _83(_498, _500, (*spvDescriptorSet0.support_buffer));
    int _504 = _432;
    int _506 = 0;
    int _508 = _83(_504, _506, (*spvDescriptorSet0.support_buffer));
    float3 _512 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_502, _508)), 0).xyz;
    float _514 = _512.x;
    float _516 = _512.y;
    float _518 = _512.z;
    int _520 = _496;
    int _522 = 0;
    int _524 = _83(_520, _522, (*spvDescriptorSet0.support_buffer));
    int _526 = _432;
    int _528 = 0;
    int _530 = _83(_526, _528, (*spvDescriptorSet0.support_buffer));
    float3 _532 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_524, _530)), 0).xyz;
    float _534 = _532.x;
    float _536 = _532.y;
    float _538 = _532.z;
    float _540 = _267 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _542 = _267 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _544 = _267 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _546 = fma(_265, (*spvDescriptorSet0.vp_c10)._m0[5].x, _540);
    float _548 = fma(_265, (*spvDescriptorSet0.vp_c10)._m0[4].x, _542);
    float _550 = fma(_265, (*spvDescriptorSet0.vp_c10)._m0[6].x, _544);
    float _552 = fma(_269, (*spvDescriptorSet0.vp_c10)._m0[5].z, _546);
    float _554 = fma(_269, (*spvDescriptorSet0.vp_c10)._m0[4].z, _548);
    float _556 = fma(_269, (*spvDescriptorSet0.vp_c10)._m0[6].z, _550);
    float _558 = _552 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _560 = _554 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _562 = _299 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _564 = isnan(_299);
    bool _566 = _562 || _564;
    bool _568 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _570 = _566 || _568;
    float _572 = float(_570);
    float _574 = -_558;
    float _576 = _574 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _578 = _556 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _580 = -_560;
    float _582 = _580 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _584 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _586 = _558 + _584;
    float _588 = _576 * _576;
    float _590 = -_578;
    float _592 = _590 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _594 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _596 = _560 + _594;
    float _598 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _600 = _578 + _598;
    float _602 = fma(_582, _582, _588);
    float _604 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _606 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _604;
    float _608 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _610 = _608 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _612 = fma(_592, _592, _602);
    float _614 = rsqrt(_612);
    float _616 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _618 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _616;
    float _620 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _622 = _620 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _624 = 1.0 / _618;
    float _626 = _592 * _614;
    float _628 = _576 * _614;
    float _630 = _582 * _614;
    float _632 = 1.0 / _622;
    float _634 = _626 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _636 = _628 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _638 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _640 = _299 + _638;
    float _642 = -_634;
    float _644 = fma(_630, (*spvDescriptorSet0.vp_c10)._m0[10].y, _642);
    float _646 = -_636;
    float _648 = fma(_626, (*spvDescriptorSet0.vp_c10)._m0[9].y, _646);
    float _650 = _630 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _652 = _640 * _624;
    float _654 = _644 * _644;
    float _656 = _586 * _586;
    float _658 = -_650;
    float _660 = fma(_628, (*spvDescriptorSet0.vp_c10)._m0[8].y, _658);
    float _662 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _664 = _299 + _662;
    float _666 = fma(_648, _648, _654);
    float _668 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _670 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _668;
    float _672 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _674 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _672;
    float _676 = _664 * _632;
    float _678 = fma(_660, _660, _666);
    float _680 = fma(_596, _596, _656);
    float _682 = fma(_670, _652, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _684 = fma(_674, _652, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _686 = fma(_606, _652, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _688 = fma(_600, _600, _680);
    float _690 = rsqrt(_678);
    float _692 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _694 = _692 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _696 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _698 = _696 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _700 = fma(_610, _676, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _702 = fma(_694, _676, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _704 = fma(_698, _676, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _706 = rsqrt(_688);
    float _708 = _648 * _690;
    float _710 = _660 * _690;
    float _712 = _644 * _690;
    float _714 = _708 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _716 = _710 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _718 = _712 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _720 = -_714;
    float _722 = fma(_710, (*spvDescriptorSet0.vp_c10)._m0[8].y, _720);
    float _724 = -_716;
    float _726 = fma(_712, (*spvDescriptorSet0.vp_c10)._m0[10].y, _724);
    float _728 = -_718;
    float _730 = fma(_708, (*spvDescriptorSet0.vp_c10)._m0[9].y, _728);
    bool _732 = _299 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _734 = isnan(_299);
    bool _736 = _732 || _734;
    bool _738 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _740 = _736 || _738;
    float _742 = float(_740);
    float _744 = _586 * _706;
    float _746 = _722 * _722;
    bool _748 = _299 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _750 = isnan(_299);
    bool _752 = _748 || _750;
    bool _754 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _756 = _752 || _754;
    float _758 = float(_756);
    float _760 = _596 * _706;
    float _762 = -_744;
    float _764 = fma(_762, (*spvDescriptorSet0.vp_c9)._m0[18].w, _586);
    float _766 = -_742;
    float _768 = _766 + 1.0;
    float _770 = fma(_726, _726, _746);
    float _772 = -_760;
    float _774 = fma(_772, (*spvDescriptorSet0.vp_c9)._m0[18].w, _596);
    float _776 = _764 * _764;
    float _778 = _758 * _768;
    float _780 = -_758;
    float _782 = _780 + 1.0;
    float _784 = fma(_730, _730, _770);
    float _786 = in.m_55.x;
    float _788 = in.m_55.y;
    float _790 = in.m_55.z;
    float _792 = _600 * _706;
    float _794 = _572 * _782;
    float _796 = fma(_774, _774, _776);
    float _798 = -_572;
    float _800 = _798 + 1.0;
    float _802 = -_792;
    float _804 = fma(_802, (*spvDescriptorSet0.vp_c9)._m0[18].w, _600);
    float _806 = rsqrt(_784);
    float _808 = _682 * _794;
    float _810 = _684 * _794;
    float _812 = _686 * _794;
    float _814 = fma(_804, _804, _796);
    float _816 = fma(_800, (*spvDescriptorSet0.vp_c9)._m0[143].x, _808);
    float _818 = fma(_800, (*spvDescriptorSet0.vp_c9)._m0[143].y, _810);
    float _820 = fma(_800, (*spvDescriptorSet0.vp_c9)._m0[143].z, _812);
    float _822 = floor(_327);
    float _824 = fma(_704, _778, _816);
    float _826 = fma(_702, _778, _818);
    float _828 = fma(_700, _778, _820);
    float _830 = fma(_742, (*spvDescriptorSet0.vp_c9)._m0[145].x, _824);
    float _832 = fma(_742, (*spvDescriptorSet0.vp_c9)._m0[145].y, _826);
    float _834 = fma(_742, (*spvDescriptorSet0.vp_c9)._m0[145].z, _828);
    float _836 = sqrt(_814);
    float _838 = _722 * _806;
    float _840 = _832 * _788;
    float _842 = _726 * _806;
    float _844 = _730 * _806;
    float _846 = _838 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _848 = _840 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _850 = _830 * _786;
    float _852 = -_822;
    float _854 = _327 + _852;
    float _856 = fma(_842, (*spvDescriptorSet0.vp_c10)._m0[8].z, _846);
    float _858 = _834 * _790;
    float _860 = _850 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _862 = fma(_844, (*spvDescriptorSet0.vp_c10)._m0[10].z, _856);
    float _864 = _858 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _866 = _706 * _836;
    float _868 = abs(_862);
    float _870 = -_868;
    float _872 = _870 + 1.0;
    float _874 = _848 * _866;
    float _876 = _860 * _866;
    float _878 = _864 * _866;
    float _880 = -_516;
    float _882 = _880 + _536;
    float _884 = -_514;
    float _886 = _884 + _534;
    float _888 = -_518;
    float _890 = _888 + _538;
    int _892 = as_type<int>(_872) + (-218103808);
    float _894 = fma(_854, _882, _516);
    float _896 = fma(_854, _886, _514);
    float _898 = fma(_854, _890, _518);
    bool _900 = uint(_892) >= 1920991232u;
    float _902 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _894);
    float _904 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _896);
    float _906 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _898);
    out.m_61.y = _894;
    float _908 = _874 * _902;
    float _910 = _876 * _904;
    float _912 = _878 * _906;
    float _914 = _908 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _916 = _908 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _918 = _908 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _920 = fma(_910, (*spvDescriptorSet0.vp_c10)._m0[8].x, _914);
    float _922 = fma(_910, (*spvDescriptorSet0.vp_c10)._m0[9].x, _916);
    float _924 = fma(_910, (*spvDescriptorSet0.vp_c10)._m0[10].x, _918);
    float _926 = abs(_862);
    float _928 = fma(_926, -0.0187292993068695068359375, 0.074261002242565155029296875);
    float _930 = fma(_912, (*spvDescriptorSet0.vp_c10)._m0[8].z, _920);
    float _932 = fma(_912, (*spvDescriptorSet0.vp_c10)._m0[9].z, _922);
    float _934 = fma(_912, (*spvDescriptorSet0.vp_c10)._m0[10].z, _924);
    float _936 = abs(_862);
    float _938 = fma(_936, _928, -0.212114393711090087890625);
    float _940 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _942 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _944 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _946 = abs(_862);
    float _948 = fma(_946, _938, 1.570728778839111328125);
    float _950 = _940 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _952 = _942 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _954 = _944 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _956 = _862 < 0.0;
    float _958 = float(_956);
    bool _960 = !_900;
    float _962 = _930;
    float _984;
    if (!_960)
    {
        int _964 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[107].z);
        int _966 = as_type<int>(_872);
        int _968 = 4960;
        int _970 = as_type<int>(_922);
        int _972;
        int _974;
        int _976;
        int _978;
        int _980;
        int _982;
        _80(_964, _966, _968, _970, _972, _974, _976, _978, _980, _982, out.gl_Position, out.gl_PointSize);
        _984 = as_type<float>(_976);
        _986 = true;
    }
    else
    {
        float _988 = rsqrt(_872);
        float _990 = _872 * _988;
        float _992 = _988 * 0.5;
        float _994 = -_990;
        float _996 = 0.0 + _994;
        float _998 = fma(_992, _996, 0.5);
        float _1000 = fma(_990, _998, _990);
        float _1002 = -_1000;
        float _1004 = 0.0 + _1002;
        float _1006 = fma(_1000, _1004, _872);
        float _1008 = fma(_992, _1006, _1000);
        _984 = _1008;
    }
    _986 = false;
    float _1010 = _984;
    float _1012 = _844 * (*spvDescriptorSet0.vp_c10)._m0[8].z;
    float _1014 = _838 * (*spvDescriptorSet0.vp_c10)._m0[10].z;
    float _1016 = _948 * _1010;
    float _1018 = -_1012;
    float _1020 = fma(_842, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1018);
    float _1022 = _842 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _1024 = -_1014;
    float _1026 = fma(_844, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1024);
    float _1028 = _1020 * _1020;
    float _1030 = -_1022;
    float _1032 = fma(_838, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1030);
    float _1034 = -(*spvDescriptorSet0.vp_c9)._m0[192].y;
    float _1036 = (*spvDescriptorSet0.vp_c10)._m0[8].w + _1034;
    float _1038 = fma(_1026, _1026, _1028);
    float _1040 = _958 * 2.0;
    float _1042 = -(*spvDescriptorSet0.vp_c9)._m0[192].w;
    float _1044 = (*spvDescriptorSet0.vp_c10)._m0[10].w + _1042;
    float _1046 = fma(_1032, _1032, _1038);
    float _1048 = -_1040;
    float _1050 = fma(_1016, _1048, _1016);
    float _1052 = rsqrt(_1046);
    float _1054 = fma(_958, 3.1415927410125732421875, _1050);
    float _1056 = _1054 * 0.15915493667125701904296875;
    float _1058 = _1056 * 6.283185482025146484375;
    float _1060 = cos(_1058);
    float _1062 = _1020 * _1052;
    float _1064 = _1026 * _1052;
    float _1066 = _1032 * _1052;
    float _1068 = _1062 * _1062;
    float _1070 = fma(_1064, _1064, _1068);
    float _1072 = fma(_1066, _1066, _1070);
    float _1074 = -(*spvDescriptorSet0.vp_c9)._m0[192].z;
    float _1076 = (*spvDescriptorSet0.vp_c10)._m0[9].w + _1074;
    float _1078 = -_1036;
    float _1080 = _1078 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1082 = -_1076;
    float _1084 = _1082 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1086 = rsqrt(_1072);
    float _1088 = _1084 * _1084;
    float _1090 = fma(_1080, _1080, _1088);
    float _1092 = _1056 * 6.283185482025146484375;
    float _1094 = sin(_1092);
    float _1096 = -_1044;
    float _1098 = _1096 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1100 = fma(_1098, _1098, _1090);
    float _1102 = -_1060;
    float _1104 = _1102 + 1.0;
    float _1106 = _1064 * _1086;
    float _1108 = _1062 * _1086;
    float _1110 = _1066 * _1086;
    float _1112 = sqrt(_1100);
    float _1114 = _1106 * _1104;
    float _1116 = _1108 * _1104;
    float _1118 = _1110 * _1110;
    float _1120 = _1110 * _1094;
    float _1122 = _1106 * _1094;
    float _1124 = _1108 * _1094;
    float _1126 = fma(_1106, _1114, _1060);
    float _1128 = -_1120;
    float _1130 = fma(_1108, _1114, _1128);
    float _1132 = fma(_1110, _1116, _1122);
    float _1134 = -_1124;
    float _1136 = fma(_1110, _1114, _1134);
    float _1138 = fma(_1104, _1118, _1060);
    float _1140 = _932 * _1130;
    float _1142 = _932 * _1132;
    float _1144 = fma(_1110, _1114, _1124);
    float _1146 = fma(_1112, 0.0068421051837503910064697265625, 0.3157894611358642578125);
    float _1148 = fma(_930, _1126, _1140);
    float _1150 = fma(_930, _1136, _1142);
    float _1152 = fma(_1108, _1116, _1060);
    float _1154 = fma(_1108, _1114, _1120);
    float _1156 = fma(_934, _1144, _1148);
    float _1158 = fma(_934, _1138, _1150);
    float _1160 = precise::max(_1146, 0.3499999940395355224609375);
    float _1162 = _932 * _1152;
    float _1164 = _560 + _1156;
    float _1166 = _578 + _1158;
    float _1168 = precise::min(_1160, 1.0);
    float _1170 = -_1122;
    float _1172 = fma(_1110, _1116, _1170);
    float _1174 = -_1036;
    float _1176 = _1164 + _1174;
    float _1178 = -_1044;
    float _1180 = _1166 + _1178;
    float _1182 = fma(_930, _1154, _1162);
    float _1184 = fma(_1176, _1168, _1036);
    float _1186 = fma(_1180, _1168, _1044);
    float _1188 = fma(_934, _1172, _1182);
    float _1190 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1192 = _1184 + _1190;
    float _1194 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1196 = _1186 + _1194;
    float _1198 = _558 + _1188;
    float _1200 = _1192 * _1192;
    float _1202 = _1196 * _1196;
    float _1204 = -_1076;
    float _1206 = _1198 + _1204;
    float _1208 = _1200 + _1202;
    float _1210 = fma(_1206, _1168, _1076);
    float _1212 = sqrt(_1208);
    bool _1214 = _1212 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1216 = _1152;
    float _1218 = _1076;
    float _1220 = _1182;
    float _1222 = _1206;
    float _1224 = _1154;
    float _1226 = _1192;
    float _1228 = _1114;
    if (!_1214)
    {
        _1216 = _1202;
    }
    float _1230 = _1216;
    float _1232 = _1230;
    if (!_1214)
    {
        _962 = _1200;
    }
    float _1234 = _962;
    float _1236 = _1234;
    if (!_1214)
    {
        _1218 = _1184;
    }
    float _1238 = _1218;
    float _1240 = _1238;
    if (!_1214)
    {
        _1220 = _1186;
    }
    float _1242 = _1220;
    float _1244 = _1242;
    if (!_1214)
    {
        _1222 = _1210;
    }
    float _1246 = _1222;
    bool _1248 = !_1214;
    float _1250 = _1246;
    if (!_1248)
    {
        float _1252 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1254 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1256 = _1212 + _1254;
        float _1258 = _1210 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1260 = rsqrt(_1208);
        float _1262 = _1256 * _1252;
        float _1264 = _1262 * 0.15915493667125701904296875;
        float _1266 = _1264 * 6.283185482025146484375;
        float _1268 = sin(_1266);
        float _1270 = _1264 * 6.283185482025146484375;
        float _1272 = cos(_1270);
        float _1274 = fma(_1268, _1258, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1276 = _1260 * _1274;
        float _1278 = _1272 + (-1.0);
        float _1280 = _1278 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1282 = _1192 * _1276;
        float _1284 = _1196 * _1276;
        float _1286 = fma(_1210, _1272, _1280);
        float _1288 = _1282 + (*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1290 = _1284 + (*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1292 = _1282 * _1282;
        float _1294 = _1284 * _1284;
        _1250 = _1286;
        _1236 = _1292;
        _1232 = _1294;
        _1240 = _1288;
        _1244 = _1290;
    }
    float _1296 = _1250;
    float _1298 = _1236;
    float _1300 = _1232;
    float _1302 = _1240;
    float _1304 = _1244;
    float _1306 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1308 = _1296 + _1306;
    out.m_63.x = _950;
    out.m_63.y = _952;
    out.m_63.z = _954;
    float _1310 = fma(_1308, _1308, _1298);
    float _1312 = _1310 + _1300;
    float _1314 = sqrt(_1312);
    bool _1316 = _1314 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1318 = isnan(_1314);
    bool _1320 = _1316 || _1318;
    bool _1322 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1324 = _1320 || _1322;
    float _1326 = _1298;
    if (!_1324)
    {
        _1326 = 1.0;
    }
    float _1328 = _1326;
    bool _1330 = !_1324;
    float _1332 = _1328;
    if (!_1330)
    {
        bool _1334 = _1314 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1336 = isnan(_1314);
        bool _1338 = _1334 || _1336;
        bool _1340 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1342 = _1338 || _1340;
        if (!_1342)
        {
            float _1344 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1346 = _1314 + _1344;
            float _1348 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1350 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1348;
            float _1352 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1354 = _1352 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1356 = 1.0 / _1350;
            float _1358 = _1346 * _1356;
            float _1360 = fma(_1358, _1354, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1332 = _1360;
            _1362 = true;
        }
        else
        {
            bool _1364 = _1314 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1366 = isnan(_1314);
            bool _1368 = _1364 || _1366;
            bool _1370 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1372 = _1368 || _1370;
            if (!_1372)
            {
                float _1374 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1376 = _1314 + _1374;
                float _1378 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1380 = _1378 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1382 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1384 = _1382 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1386 = 1.0 / _1380;
                float _1388 = _1376 * _1386;
                float _1390 = fma(_1388, _1384, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1332 = _1390;
                _1362 = true;
            }
            else
            {
                _1332 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1362 = false;
    float _1392 = _1332;
    float _1394 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1396 = _1296 + _1394;
    float _1398 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1400 = _1302 + _1398;
    float _1402 = fma(_1396, _1392, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1404 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1406 = _1304 + _1404;
    float _1408 = fma(_1400, _1392, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1410 = -_744;
    float _1412 = fma(_1410, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1402);
    float _1414 = fma(_1406, _1392, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1416 = -_760;
    float _1418 = fma(_1416, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1408);
    float _1420 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1422 = _1412 + _1420;
    float _1424 = -_792;
    float _1426 = fma(_1424, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1414);
    float _1428 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1430 = _1418 + _1428;
    float _1432 = _1422 * _1422;
    float _1434 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1436 = _1426 + _1434;
    float _1438 = fma(_1430, _1430, _1432);
    float _1440 = fma(_1436, _1436, _1438);
    float _1442 = rsqrt(_1440);
    float _1444 = _1442 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1446 = _1430 * _1444;
    float _1448 = _1436 * _1444;
    float _1450 = _1446 * _1446;
    float _1452 = _1448 * _1448;
    float _1454 = _1450 + _1452;
    float _1456 = sqrt(_1454);
    bool _1458 = _1456 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1460 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1462 = _1456 + _1460;
    float _1464 = _1436;
    float _1466 = _1454;
    float _1468 = _1462;
    float _1470 = _1446;
    if (_1458)
    {
        float _1472 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1464 = _1472;
    }
    float _1474 = _1464;
    if (_1458)
    {
        float _1476 = rsqrt(_1454);
        _1466 = _1476;
    }
    float _1478 = _1466;
    float _1480 = _1478;
    if (_1458)
    {
        float _1482 = _1462 * _1474;
        _1468 = _1482;
    }
    float _1484 = _1468;
    if (_1458)
    {
        float _1486 = _1484 * 0.15915493667125701904296875;
        _1224 = _1486;
    }
    float _1488 = _1224;
    float _1490 = _1442;
    if (_1458)
    {
        float _1492 = _1488 * 6.283185482025146484375;
        float _1494 = sin(_1492);
        _1490 = _1494;
    }
    float _1496 = _1490;
    float _1498 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1500 = precise::max(0.0, _1498);
    float _1502 = _1310;
    float _1504 = _1500;
    float _1506 = _1498;
    if (_1458)
    {
        float _1508 = _1488 * 6.283185482025146484375;
        float _1510 = cos(_1508);
        _1502 = _1510;
    }
    float _1512 = _1502;
    float _1514 = -_1444;
    float _1516 = -_1500;
    float _1518 = fma(_1422, _1514, _1516);
    if (_1458)
    {
        float _1520 = _1518 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1504 = _1520;
    }
    float _1522 = _1504;
    float _1524 = sqrt(_1440);
    float _1526 = _1496;
    float _1528 = _1522;
    if (_1458)
    {
        float _1530 = fma(_1496, _1522, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1526 = _1530;
    }
    float _1532 = _1526;
    float _1534 = _1532;
    if (!_1458)
    {
        _1528 = _1448;
    }
    float _1536 = _1528;
    float _1538 = _1536;
    if (_1458)
    {
        float _1540 = _1512 + (-1.0);
        _1506 = _1540;
    }
    float _1542 = _1506;
    float _1544 = _1542;
    if (_1458)
    {
        float _1546 = _1478 * _1532;
        _1226 = _1546;
    }
    float _1548 = _1226;
    if (!_1458)
    {
        _1534 = _1518;
    }
    float _1550 = _1534;
    float _1552 = _1550;
    if (_1458)
    {
        float _1554 = _1542 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1228 = _1554;
    }
    float _1556 = _1228;
    if (_1458)
    {
        float _1558 = _1446 * _1548;
        _1470 = _1558;
    }
    float _1560 = _1470;
    if (!_1458)
    {
        _1480 = _1450;
    }
    float _1562 = _1480;
    float _1564 = _1562;
    if (_1458)
    {
        float _1566 = _1448 * _1548;
        _1538 = _1566;
    }
    float _1568 = _1538;
    if (_1458)
    {
        float _1570 = fma(_1518, _1512, _1556);
        _1552 = _1570;
    }
    float _1572 = _1552;
    if (_1458)
    {
        float _1574 = _1560 * _1560;
        _1564 = _1574;
    }
    float _1576 = _1564;
    if (!_1458)
    {
        _1544 = _1452;
    }
    float _1578 = _1544;
    float _1580 = _1578;
    if (_1458)
    {
        float _1582 = _1568 * _1568;
        _1580 = _1582;
    }
    float _1584 = _1580;
    float _1586 = fma(_1572, _1572, _1576);
    float _1588 = _1586 + _1584;
    float _1590 = _1412 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1592 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1594 = fma(_1524, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1592);
    float _1596 = precise::clamp(_1594, 0.0, 1.0);
    float _1598 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1600 = rsqrt(_1588);
    float _1602 = fma(_1418, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1590);
    float _1604 = _1412 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1606 = -_1596;
    float _1608 = _1606 + 1.0;
    float _1610 = _1412 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1612 = fma(_1426, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1602);
    float _1614 = fma(_1418, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1604);
    float _1616 = _1412 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1618 = fma(_1418, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1610);
    float _1620 = _1612 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1622 = fma(_1426, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1614);
    float _1624 = abs(_1608);
    float _1626 = log2(_1624);
    float _1628 = fma(_1426, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1618);
    float _1630 = _1620 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1632 = fma(_1418, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1616);
    float _1634 = _1622 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1636 = _1600 * _1560;
    float _1638 = -_1630;
    float _1640 = fma(_1638, _1598, 1.0);
    float _1642 = _1628 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1644 = _1600 * _1572;
    float _1646 = _1636 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1648 = fma(_1426, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1632);
    float _1650 = _1634 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1652 = _1600 * _1568;
    float _1654 = -_1646;
    float _1656 = fma(_1644, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1654);
    float _1658 = _1648 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1660 = fma(_1642, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1650);
    float _1662 = _1626 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1664 = -_1652;
    float _1666 = fma(_1664, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1656);
    float _1668 = log2(_1640);
    float _1670 = fma(_1620, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1660);
    float _1672 = _1634 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1674 = fma(_1666, -0.5, 0.5);
    float _1676 = _1634 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1678 = fma(_1658, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1670);
    float _1680 = fma(_1666, 0.5, 0.5);
    float _1682 = fma(_1642, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1672);
    float _1684 = exp2(_1662);
    float _1686 = fma(_1642, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1676);
    float _1688 = _1644 + 1.0;
    float _1690 = fma(_1680, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1692 = fma(_1620, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1682);
    float _1694 = fma(_1620, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1686);
    float _1696 = fma(_1680, _1690, -0.212114393711090087890625);
    float _1698 = 1.0 / _1678;
    float _1700 = fma(_1658, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1694);
    float _1702 = _1668 * 0.693147182464599609375;
    float _1704 = fma(_1680, _1696, 1.570728778839111328125);
    float _1706 = _1702 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1708 = sqrt(_1674);
    float _1710 = -_1644;
    float _1712 = fma(_1684, _1688, _1710);
    float _1714 = fma(_1658, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1692);
    float _1716 = fma(_1712, 0.5, 0.5);
    float _1718 = _1714 * _1698;
    float _1720 = _1700 * _1698;
    float _1722 = fma(_1718, 0.5, 0.5);
    float _1724 = fma(_1720, -0.5, 0.5);
    float _1726 = _1708 * 0.636619746685028076171875;
    float _1728 = -_1704;
    float _1730 = fma(_1726, _1728, 1.0);
    float3 _4539 = float3(_1722, _1724, _1706);
    float _1732 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4539, float3(0.0), isnan(_4539)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4539, float3(0.0), isnan(_4539)), level(0.0)).x;
    float3 _4550 = float3(_1722, _1724, _1706);
    float4 _1735 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4550, float3(0.0), isnan(_4550)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4550, float3(0.0), isnan(_4550)), level(0.0)).xyzw;
    float _1737 = _1735.x;
    float _1739 = _1735.y;
    float _1741 = _1735.z;
    float _1743 = _1735.w;
    float2 _4567 = float2(_1730, _1716);
    float3 _1745 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4567, float2(0.0), isnan(_4567)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4567, float2(0.0), isnan(_4567)), level(0.0)).xyz;
    float _1747 = _1745.x;
    float _1749 = _1745.y;
    float _1751 = _1745.z;
    float _1753 = -_744;
    float _1755 = fma(_1753, (*spvDescriptorSet0.vp_c9)._m0[18].w, _558);
    float _1757 = -_760;
    float _1759 = fma(_1757, (*spvDescriptorSet0.vp_c9)._m0[18].w, _560);
    float _1761 = -_792;
    float _1763 = fma(_1761, (*spvDescriptorSet0.vp_c9)._m0[18].w, _578);
    float _1765 = _1755 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1767 = fma(_1759, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1765);
    float _1769 = _1755 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1771 = fma(_1763, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1767);
    float _1773 = fma(_1759, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1769);
    float _1775 = _1626 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _1777 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1779 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1781 = _1777 || _1779;
    bool _1783 = isnan(0.5);
    bool _1785 = _1781 || _1783;
    float _1787 = _1771 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1789 = fma(_1763, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1773);
    float _1791 = _1634 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1793 = exp2(_1775);
    float _1795 = _1789 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1797 = fma(_1642, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1791);
    float _1799 = _1795 + _1787;
    float _1801 = fma(_1620, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1797);
    float _1803 = 1.0 / _1787;
    float _1805 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    if (_1785)
    {
        _1805 = 1.0;
    }
    float _1807 = _1805;
    float _1809 = fma(_1658, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1801);
    float _1811 = _1799 * _1803;
    float _1813 = _1811 * 0.5;
    float _1815 = _1807;
    if (!_1785)
    {
        float _1817 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1819 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1821 = fma(_1813, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1819);
        float _1823 = _1817 * 0.15915493667125701904296875;
        float _1825 = _1823 * 6.283185482025146484375;
        float _1827 = cos(_1825);
        float _1829 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1831 = _1829 * 0.15915493667125701904296875;
        float _1833 = _1823 * 6.283185482025146484375;
        float _1835 = sin(_1833);
        float _1837 = 1.0 / _1827;
        float _1839 = _1831 * 6.283185482025146484375;
        float _1841 = cos(_1839);
        float _1843 = _1835 * _1837;
        float _1845 = 1.0 / _1821;
        float _1847 = _1841 * _1843;
        float _1849 = _1831 * 6.283185482025146484375;
        float _1851 = sin(_1849);
        float _1853 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1855 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1853;
        float _1857 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1859 = _1845 * _1857;
        float _1861 = 1.0 / _1847;
        float _1863 = 1.0 / _1855;
        float _1865 = _1851 * _1861;
        float _1867 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1869 = fma(_1865, _1859, _1867);
        float _1871 = _1869 * _1863;
        float _1873 = precise::clamp(_1871, 0.0, 1.0);
        float _1875 = -_1873;
        float _1877 = _1875 + 1.0;
        _1815 = _1877;
    }
    float _1879 = _1815;
    float _1881 = _1809 + _1678;
    float _1883 = -_1793;
    float _1885 = _1883 + 1.0;
    bool _1887 = _1879 > 0.0;
    bool _1889 = isnan(_1879);
    bool _1891 = _1887 || _1889;
    bool _1893 = isnan(0.0);
    bool _1895 = _1891 || _1893;
    float _1897 = _1879 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1899 = _1881 * 0.5;
    float _1901 = _1885 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1903 = _1897 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1905 = _1901 * _1732;
    float _1907 = -_1901;
    float _1909 = _1907 + 1.0;
    out.gl_Position.x = _1714;
    out.gl_Position.y = _1700;
    out.gl_Position.z = _1809;
    out.gl_Position.w = _1678;
    float _1911 = _1743 * _1905;
    float _1913 = _1751 * _1905;
    out.m_65.z = _1899;
    out.m_65.w = _1678;
    float _1915 = fma(_1747, _1911, _1737);
    float _1917 = fma(_1749, _1911, _1739);
    float _1919 = _1743 * _1909;
    float _1921 = fma(_1743, _1913, _1741);
    out.m_49.x = _1903;
    out.m_67.x = _1915;
    out.m_67.y = _1917;
    out.m_67.z = _1921;
    out.m_67.w = _1919;
    if (_1895)
    {
        return out;
    }
    out.m_49.x = 0.0;
    float _1923 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1923;
    return out;
}


struct dm_geometry_capture { device uint* dst; uint4 info; uint stride; short slot[144]; };
static inline void dm_cw(constant dm_geometry_capture& g, device uint* p, uint k, uint v) { short s = g.slot[k]; if (s >= 0) p[s] = v; }
vertex void main0_gs(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint dm_vid [[vertex_id]], uint dm_iid [[instance_id]], constant dm_geometry_capture& dm_gs [[buffer(13)]])
{
    uint4 dm_ci = dm_gs.info; device uint* dm_capture = dm_gs.dst;
    if (dm_vid - dm_ci.x >= dm_ci.y || dm_iid - dm_ci.z >= dm_ci.w) return;
    device uint* dm_p = dm_capture + ((ulong(dm_iid - dm_ci.z) * dm_ci.y + dm_vid - dm_ci.x) * dm_gs.stride);

    main0_out out = {};
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1362 = false;
    bool _986 = false;
    bool _291 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _87 = in.m_46.w;
    float _89 = trunc(_87);
    int _91 = int(_89);
    bool _95 = _91 >= 1;
    float _97 = 0.0;
    if (!_95)
    {
        _97 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _99 = _97;
    float _101 = _99;
    if (!_95)
    {
        out.m_49.x = 0.0;
    }
    int _103 = 0;
    if (!_95)
    {
        float _105 = _99 * 5.0;
        _103 = as_type<int>(_105);
    }
    int _107 = _103;
    int _109 = _107;
    if (!_95)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1980 = as_type<float>(_107);
        out.gl_Position.z = _1980;
    }
    if (!_95)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _111 = in.m_51.w;
    bool _113 = _111 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _115 = isnan(_111);
    bool _117 = _113 || _115;
    bool _119 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _121 = _117 || _119;
    float _123 = -_111;
    float _125 = _123 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_121)
    {
        float _127 = float(_91);
        _101 = _127;
    }
    float _129 = _101;
    bool _131 = _125 >= _129;
    bool _133 = !_121;
    bool _135 = _131 || _133;
    float _137 = _129;
    if (_135)
    {
        _137 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _139 = _137;
    if (_135)
    {
        out.m_49.x = 0.0;
    }
    if (_135)
    {
        float _141 = _139 * 5.0;
        _109 = as_type<int>(_141);
    }
    int _143 = _109;
    if (_135)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2049 = as_type<float>(_143);
        out.gl_Position.z = _2049;
    }
    if (_135)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _145 = in.m_53.x;
    float _147 = _125 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _149 = in.m_53.y;
    bool _151 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _153 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _155 = _151 || _153;
    bool _157 = isnan(1.0);
    bool _159 = _155 || _157;
    float _161 = in.m_55.w;
    float _163 = in.m_51.x;
    float _165 = in.m_51.y;
    float _167 = in.m_51.z;
    float _169 = in.m_46.x;
    float _171 = in.m_46.y;
    float _173 = in.m_46.z;
    float _175 = 0.0;
    float _177 = _147;
    if (!_159)
    {
        float _179 = _147 * _147;
        float _181 = _179 * 0.5;
        _175 = _181;
    }
    float _183 = _175;
    float _185 = _183;
    if (!_159)
    {
        float _187 = _183 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _185 = _187;
    }
    float _189 = _185;
    out.m_57.x = _145;
    out.m_57.y = _149;
    bool _191 = !_159;
    float _193 = _189;
    if (!_191)
    {
        float _195 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _197 = log2(_195);
        float _199 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _201 = _199 + 1.0;
        float _203 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _205 = _147 * _197;
        float _207 = exp2(_205);
        float _209 = _203 * 0.693147182464599609375;
        float _211 = 1.0 / _209;
        float _213 = 1.0 / _201;
        float _215 = _207 + (-1.0);
        float _217 = -_215;
        float _219 = fma(_217, _211, _147);
        float _221 = _219 * _213;
        float _223 = _221 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _193 = _223;
    }
    float _225 = _193;
    bool _227 = !_159;
    if (!_227)
    {
        float _229 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _231 = log2(_229);
        float _233 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _235 = _233 + 1.0;
        float _237 = 1.0 / _235;
        float _239 = _147 * _231;
        float _241 = exp2(_239);
        float _243 = -_241;
        float _245 = _243 + 1.0;
        float _247 = _245 * _237;
        _177 = _247;
    }
    float _249 = _177;
    bool _251 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _253 = _225 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _255 = _225 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _257 = _225 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _259 = fma(_249, _163, _253);
    float _261 = fma(_249, _165, _255);
    float _263 = fma(_249, _167, _257);
    float _265 = fma(_259, _161, _169);
    float _267 = fma(_261, _161, _171);
    float _269 = fma(_263, _161, _173);
    bool _271 = !_251;
    float _289;
    if (!_271)
    {
        float _273 = in.m_59.x;
        float _275 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _277 = _273 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _279 = fma(_277, (*spvDescriptorSet0.vp_c9)._m0[12].x, _125);
        float _281 = _279 * _275;
        float _283 = floor(_281);
        float _285 = -_283;
        float _287 = _281 + _285;
        _289 = _287;
        _291 = true;
    }
    else
    {
        float _293 = float(_91);
        float _295 = 1.0 / _293;
        float _297 = _125 * _295;
        _289 = _297;
    }
    _291 = false;
    float _299 = _289;
    int _301 = int2(spvDescriptorSet0.vp_t_tcb_C.get_width(), spvDescriptorSet0.vp_t_tcb_C.get_height()).x;
    int _303 = _301;
    int _305 = 0;
    int _307 = _82(_303, _305, (*spvDescriptorSet0.support_buffer));
    float _309 = in.m_59.x;
    float _311 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[191].y;
    float _313 = (*spvDescriptorSet0.vp_c10)._m0[2].x * 0.0166666693985462188720703125;
    float _315 = _313 * (*spvDescriptorSet0.vp_c9)._m0[191].y;
    float _317 = floor(_315);
    float _319 = fma(_317, _311, _309);
    float _321 = _319 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _323 = float(_307);
    int _325 = abs(_307);
    float _327 = _321 * _323;
    float _329 = float(uint(_325));
    int _331 = ~_325;
    int _333 = _331 + 1;
    float _335 = trunc(_327);
    int _337 = int(_335);
    float _339 = 1.0 / _329;
    int _341 = abs(_337);
    uint _344 = uint(int(uint(_337) >> uint(31)));
    float _346 = float(uint(_341));
    int _348 = ~int(_344);
    int _350 = _348 + 1;
    int _352 = as_type<int>(_339) + (-2);
    int _354 = ~_325;
    int _356 = _354 + 1;
    float _358 = as_type<float>(_352) * _346;
    float _360 = trunc(_358);
    float _362 = precise::max(_360, 0.0);
    uint _364 = uint(_362);
    int _366 = _333 * int(_364);
    int _368 = _366 + _341;
    float _370 = float(uint(_368));
    float _372 = as_type<float>(_352) * _370;
    float _374 = trunc(_372);
    float _376 = precise::max(_374, 0.0);
    uint _378 = uint(_376);
    int _380 = int(_364) + int(_378);
    int _382 = _356 * _380;
    int _384 = _382 + _341;
    bool _386 = uint(_384) >= uint(_325);
    bool _388 = !_386;
    int _390 = _388 ? 0 : (-1);
    bool _392 = _307 == 0;
    int _394 = ~_380;
    int _396 = _394 + _390;
    int _398 = _396 + 1;
    int _400 = ~_325;
    int _402 = _400 + 1;
    int _404 = _325 * _398;
    int _406 = _404 + _341;
    float _408 = in.m_53.z;
    int _410 = _406 ^ _350;
    int _412 = ~_350;
    int _414 = _412 + _410;
    int _416 = _414 + 1;
    bool _418 = !_392;
    int _420 = _418 ? _416 : (-1);
    int _422 = _420 + 1;
    int _424 = abs(_422);
    uint _426 = uint(int(uint(_422) >> uint(31)));
    float _428 = float(uint(_424));
    float _430 = trunc(_408);
    int _432 = int(_430);
    int _434 = ~int(_426);
    int _436 = _434 + 1;
    float _438 = as_type<float>(_352) * _428;
    float _440 = trunc(_438);
    float _442 = precise::max(_440, 0.0);
    uint _444 = uint(_442);
    int _446 = _402 * int(_444);
    int _448 = _446 + _424;
    float _450 = float(uint(_448));
    float _452 = as_type<float>(_352) * _450;
    int _454 = ~_325;
    int _456 = _454 + 1;
    float _458 = trunc(_452);
    float _460 = precise::max(_458, 0.0);
    uint _462 = uint(_460);
    int _464 = int(_444) + int(_462);
    int _466 = _456 * _464;
    int _468 = _466 + _424;
    bool _470 = uint(_468) >= uint(_325);
    bool _472 = !_470;
    int _474 = _472 ? 0 : (-1);
    int _476 = ~_464;
    int _478 = _476 + _474;
    int _480 = _478 + 1;
    int _482 = _325 * _480;
    int _484 = _482 + _424;
    int _486 = _484 ^ _436;
    int _488 = ~_436;
    int _490 = _488 + _486;
    int _492 = _490 + 1;
    bool _494 = !_392;
    int _496 = _494 ? _492 : (-1);
    int _498 = _420;
    int _500 = 0;
    int _502 = _83(_498, _500, (*spvDescriptorSet0.support_buffer));
    int _504 = _432;
    int _506 = 0;
    int _508 = _83(_504, _506, (*spvDescriptorSet0.support_buffer));
    float3 _512 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_502, _508)), 0).xyz;
    float _514 = _512.x;
    float _516 = _512.y;
    float _518 = _512.z;
    int _520 = _496;
    int _522 = 0;
    int _524 = _83(_520, _522, (*spvDescriptorSet0.support_buffer));
    int _526 = _432;
    int _528 = 0;
    int _530 = _83(_526, _528, (*spvDescriptorSet0.support_buffer));
    float3 _532 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_524, _530)), 0).xyz;
    float _534 = _532.x;
    float _536 = _532.y;
    float _538 = _532.z;
    float _540 = _267 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _542 = _267 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _544 = _267 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _546 = fma(_265, (*spvDescriptorSet0.vp_c10)._m0[5].x, _540);
    float _548 = fma(_265, (*spvDescriptorSet0.vp_c10)._m0[4].x, _542);
    float _550 = fma(_265, (*spvDescriptorSet0.vp_c10)._m0[6].x, _544);
    float _552 = fma(_269, (*spvDescriptorSet0.vp_c10)._m0[5].z, _546);
    float _554 = fma(_269, (*spvDescriptorSet0.vp_c10)._m0[4].z, _548);
    float _556 = fma(_269, (*spvDescriptorSet0.vp_c10)._m0[6].z, _550);
    float _558 = _552 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _560 = _554 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _562 = _299 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _564 = isnan(_299);
    bool _566 = _562 || _564;
    bool _568 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _570 = _566 || _568;
    float _572 = float(_570);
    float _574 = -_558;
    float _576 = _574 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _578 = _556 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _580 = -_560;
    float _582 = _580 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _584 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _586 = _558 + _584;
    float _588 = _576 * _576;
    float _590 = -_578;
    float _592 = _590 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _594 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _596 = _560 + _594;
    float _598 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _600 = _578 + _598;
    float _602 = fma(_582, _582, _588);
    float _604 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _606 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _604;
    float _608 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _610 = _608 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _612 = fma(_592, _592, _602);
    float _614 = rsqrt(_612);
    float _616 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _618 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _616;
    float _620 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _622 = _620 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _624 = 1.0 / _618;
    float _626 = _592 * _614;
    float _628 = _576 * _614;
    float _630 = _582 * _614;
    float _632 = 1.0 / _622;
    float _634 = _626 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _636 = _628 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _638 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _640 = _299 + _638;
    float _642 = -_634;
    float _644 = fma(_630, (*spvDescriptorSet0.vp_c10)._m0[10].y, _642);
    float _646 = -_636;
    float _648 = fma(_626, (*spvDescriptorSet0.vp_c10)._m0[9].y, _646);
    float _650 = _630 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _652 = _640 * _624;
    float _654 = _644 * _644;
    float _656 = _586 * _586;
    float _658 = -_650;
    float _660 = fma(_628, (*spvDescriptorSet0.vp_c10)._m0[8].y, _658);
    float _662 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _664 = _299 + _662;
    float _666 = fma(_648, _648, _654);
    float _668 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _670 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _668;
    float _672 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _674 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _672;
    float _676 = _664 * _632;
    float _678 = fma(_660, _660, _666);
    float _680 = fma(_596, _596, _656);
    float _682 = fma(_670, _652, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _684 = fma(_674, _652, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _686 = fma(_606, _652, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _688 = fma(_600, _600, _680);
    float _690 = rsqrt(_678);
    float _692 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _694 = _692 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _696 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _698 = _696 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _700 = fma(_610, _676, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _702 = fma(_694, _676, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _704 = fma(_698, _676, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _706 = rsqrt(_688);
    float _708 = _648 * _690;
    float _710 = _660 * _690;
    float _712 = _644 * _690;
    float _714 = _708 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _716 = _710 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _718 = _712 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _720 = -_714;
    float _722 = fma(_710, (*spvDescriptorSet0.vp_c10)._m0[8].y, _720);
    float _724 = -_716;
    float _726 = fma(_712, (*spvDescriptorSet0.vp_c10)._m0[10].y, _724);
    float _728 = -_718;
    float _730 = fma(_708, (*spvDescriptorSet0.vp_c10)._m0[9].y, _728);
    bool _732 = _299 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _734 = isnan(_299);
    bool _736 = _732 || _734;
    bool _738 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _740 = _736 || _738;
    float _742 = float(_740);
    float _744 = _586 * _706;
    float _746 = _722 * _722;
    bool _748 = _299 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _750 = isnan(_299);
    bool _752 = _748 || _750;
    bool _754 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _756 = _752 || _754;
    float _758 = float(_756);
    float _760 = _596 * _706;
    float _762 = -_744;
    float _764 = fma(_762, (*spvDescriptorSet0.vp_c9)._m0[18].w, _586);
    float _766 = -_742;
    float _768 = _766 + 1.0;
    float _770 = fma(_726, _726, _746);
    float _772 = -_760;
    float _774 = fma(_772, (*spvDescriptorSet0.vp_c9)._m0[18].w, _596);
    float _776 = _764 * _764;
    float _778 = _758 * _768;
    float _780 = -_758;
    float _782 = _780 + 1.0;
    float _784 = fma(_730, _730, _770);
    float _786 = in.m_55.x;
    float _788 = in.m_55.y;
    float _790 = in.m_55.z;
    float _792 = _600 * _706;
    float _794 = _572 * _782;
    float _796 = fma(_774, _774, _776);
    float _798 = -_572;
    float _800 = _798 + 1.0;
    float _802 = -_792;
    float _804 = fma(_802, (*spvDescriptorSet0.vp_c9)._m0[18].w, _600);
    float _806 = rsqrt(_784);
    float _808 = _682 * _794;
    float _810 = _684 * _794;
    float _812 = _686 * _794;
    float _814 = fma(_804, _804, _796);
    float _816 = fma(_800, (*spvDescriptorSet0.vp_c9)._m0[143].x, _808);
    float _818 = fma(_800, (*spvDescriptorSet0.vp_c9)._m0[143].y, _810);
    float _820 = fma(_800, (*spvDescriptorSet0.vp_c9)._m0[143].z, _812);
    float _822 = floor(_327);
    float _824 = fma(_704, _778, _816);
    float _826 = fma(_702, _778, _818);
    float _828 = fma(_700, _778, _820);
    float _830 = fma(_742, (*spvDescriptorSet0.vp_c9)._m0[145].x, _824);
    float _832 = fma(_742, (*spvDescriptorSet0.vp_c9)._m0[145].y, _826);
    float _834 = fma(_742, (*spvDescriptorSet0.vp_c9)._m0[145].z, _828);
    float _836 = sqrt(_814);
    float _838 = _722 * _806;
    float _840 = _832 * _788;
    float _842 = _726 * _806;
    float _844 = _730 * _806;
    float _846 = _838 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _848 = _840 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _850 = _830 * _786;
    float _852 = -_822;
    float _854 = _327 + _852;
    float _856 = fma(_842, (*spvDescriptorSet0.vp_c10)._m0[8].z, _846);
    float _858 = _834 * _790;
    float _860 = _850 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _862 = fma(_844, (*spvDescriptorSet0.vp_c10)._m0[10].z, _856);
    float _864 = _858 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _866 = _706 * _836;
    float _868 = abs(_862);
    float _870 = -_868;
    float _872 = _870 + 1.0;
    float _874 = _848 * _866;
    float _876 = _860 * _866;
    float _878 = _864 * _866;
    float _880 = -_516;
    float _882 = _880 + _536;
    float _884 = -_514;
    float _886 = _884 + _534;
    float _888 = -_518;
    float _890 = _888 + _538;
    int _892 = as_type<int>(_872) + (-218103808);
    float _894 = fma(_854, _882, _516);
    float _896 = fma(_854, _886, _514);
    float _898 = fma(_854, _890, _518);
    bool _900 = uint(_892) >= 1920991232u;
    float _902 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _894);
    float _904 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _896);
    float _906 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _898);
    out.m_61.y = _894;
    float _908 = _874 * _902;
    float _910 = _876 * _904;
    float _912 = _878 * _906;
    float _914 = _908 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _916 = _908 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _918 = _908 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _920 = fma(_910, (*spvDescriptorSet0.vp_c10)._m0[8].x, _914);
    float _922 = fma(_910, (*spvDescriptorSet0.vp_c10)._m0[9].x, _916);
    float _924 = fma(_910, (*spvDescriptorSet0.vp_c10)._m0[10].x, _918);
    float _926 = abs(_862);
    float _928 = fma(_926, -0.0187292993068695068359375, 0.074261002242565155029296875);
    float _930 = fma(_912, (*spvDescriptorSet0.vp_c10)._m0[8].z, _920);
    float _932 = fma(_912, (*spvDescriptorSet0.vp_c10)._m0[9].z, _922);
    float _934 = fma(_912, (*spvDescriptorSet0.vp_c10)._m0[10].z, _924);
    float _936 = abs(_862);
    float _938 = fma(_936, _928, -0.212114393711090087890625);
    float _940 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _942 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _944 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _946 = abs(_862);
    float _948 = fma(_946, _938, 1.570728778839111328125);
    float _950 = _940 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _952 = _942 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _954 = _944 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _956 = _862 < 0.0;
    float _958 = float(_956);
    bool _960 = !_900;
    float _962 = _930;
    float _984;
    if (!_960)
    {
        int _964 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[107].z);
        int _966 = as_type<int>(_872);
        int _968 = 4960;
        int _970 = as_type<int>(_922);
        int _972;
        int _974;
        int _976;
        int _978;
        int _980;
        int _982;
        _80(_964, _966, _968, _970, _972, _974, _976, _978, _980, _982, out.gl_Position, out.gl_PointSize);
        _984 = as_type<float>(_976);
        _986 = true;
    }
    else
    {
        float _988 = rsqrt(_872);
        float _990 = _872 * _988;
        float _992 = _988 * 0.5;
        float _994 = -_990;
        float _996 = 0.0 + _994;
        float _998 = fma(_992, _996, 0.5);
        float _1000 = fma(_990, _998, _990);
        float _1002 = -_1000;
        float _1004 = 0.0 + _1002;
        float _1006 = fma(_1000, _1004, _872);
        float _1008 = fma(_992, _1006, _1000);
        _984 = _1008;
    }
    _986 = false;
    float _1010 = _984;
    float _1012 = _844 * (*spvDescriptorSet0.vp_c10)._m0[8].z;
    float _1014 = _838 * (*spvDescriptorSet0.vp_c10)._m0[10].z;
    float _1016 = _948 * _1010;
    float _1018 = -_1012;
    float _1020 = fma(_842, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1018);
    float _1022 = _842 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _1024 = -_1014;
    float _1026 = fma(_844, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1024);
    float _1028 = _1020 * _1020;
    float _1030 = -_1022;
    float _1032 = fma(_838, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1030);
    float _1034 = -(*spvDescriptorSet0.vp_c9)._m0[192].y;
    float _1036 = (*spvDescriptorSet0.vp_c10)._m0[8].w + _1034;
    float _1038 = fma(_1026, _1026, _1028);
    float _1040 = _958 * 2.0;
    float _1042 = -(*spvDescriptorSet0.vp_c9)._m0[192].w;
    float _1044 = (*spvDescriptorSet0.vp_c10)._m0[10].w + _1042;
    float _1046 = fma(_1032, _1032, _1038);
    float _1048 = -_1040;
    float _1050 = fma(_1016, _1048, _1016);
    float _1052 = rsqrt(_1046);
    float _1054 = fma(_958, 3.1415927410125732421875, _1050);
    float _1056 = _1054 * 0.15915493667125701904296875;
    float _1058 = _1056 * 6.283185482025146484375;
    float _1060 = cos(_1058);
    float _1062 = _1020 * _1052;
    float _1064 = _1026 * _1052;
    float _1066 = _1032 * _1052;
    float _1068 = _1062 * _1062;
    float _1070 = fma(_1064, _1064, _1068);
    float _1072 = fma(_1066, _1066, _1070);
    float _1074 = -(*spvDescriptorSet0.vp_c9)._m0[192].z;
    float _1076 = (*spvDescriptorSet0.vp_c10)._m0[9].w + _1074;
    float _1078 = -_1036;
    float _1080 = _1078 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1082 = -_1076;
    float _1084 = _1082 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1086 = rsqrt(_1072);
    float _1088 = _1084 * _1084;
    float _1090 = fma(_1080, _1080, _1088);
    float _1092 = _1056 * 6.283185482025146484375;
    float _1094 = sin(_1092);
    float _1096 = -_1044;
    float _1098 = _1096 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1100 = fma(_1098, _1098, _1090);
    float _1102 = -_1060;
    float _1104 = _1102 + 1.0;
    float _1106 = _1064 * _1086;
    float _1108 = _1062 * _1086;
    float _1110 = _1066 * _1086;
    float _1112 = sqrt(_1100);
    float _1114 = _1106 * _1104;
    float _1116 = _1108 * _1104;
    float _1118 = _1110 * _1110;
    float _1120 = _1110 * _1094;
    float _1122 = _1106 * _1094;
    float _1124 = _1108 * _1094;
    float _1126 = fma(_1106, _1114, _1060);
    float _1128 = -_1120;
    float _1130 = fma(_1108, _1114, _1128);
    float _1132 = fma(_1110, _1116, _1122);
    float _1134 = -_1124;
    float _1136 = fma(_1110, _1114, _1134);
    float _1138 = fma(_1104, _1118, _1060);
    float _1140 = _932 * _1130;
    float _1142 = _932 * _1132;
    float _1144 = fma(_1110, _1114, _1124);
    float _1146 = fma(_1112, 0.0068421051837503910064697265625, 0.3157894611358642578125);
    float _1148 = fma(_930, _1126, _1140);
    float _1150 = fma(_930, _1136, _1142);
    float _1152 = fma(_1108, _1116, _1060);
    float _1154 = fma(_1108, _1114, _1120);
    float _1156 = fma(_934, _1144, _1148);
    float _1158 = fma(_934, _1138, _1150);
    float _1160 = precise::max(_1146, 0.3499999940395355224609375);
    float _1162 = _932 * _1152;
    float _1164 = _560 + _1156;
    float _1166 = _578 + _1158;
    float _1168 = precise::min(_1160, 1.0);
    float _1170 = -_1122;
    float _1172 = fma(_1110, _1116, _1170);
    float _1174 = -_1036;
    float _1176 = _1164 + _1174;
    float _1178 = -_1044;
    float _1180 = _1166 + _1178;
    float _1182 = fma(_930, _1154, _1162);
    float _1184 = fma(_1176, _1168, _1036);
    float _1186 = fma(_1180, _1168, _1044);
    float _1188 = fma(_934, _1172, _1182);
    float _1190 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1192 = _1184 + _1190;
    float _1194 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1196 = _1186 + _1194;
    float _1198 = _558 + _1188;
    float _1200 = _1192 * _1192;
    float _1202 = _1196 * _1196;
    float _1204 = -_1076;
    float _1206 = _1198 + _1204;
    float _1208 = _1200 + _1202;
    float _1210 = fma(_1206, _1168, _1076);
    float _1212 = sqrt(_1208);
    bool _1214 = _1212 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1216 = _1152;
    float _1218 = _1076;
    float _1220 = _1182;
    float _1222 = _1206;
    float _1224 = _1154;
    float _1226 = _1192;
    float _1228 = _1114;
    if (!_1214)
    {
        _1216 = _1202;
    }
    float _1230 = _1216;
    float _1232 = _1230;
    if (!_1214)
    {
        _962 = _1200;
    }
    float _1234 = _962;
    float _1236 = _1234;
    if (!_1214)
    {
        _1218 = _1184;
    }
    float _1238 = _1218;
    float _1240 = _1238;
    if (!_1214)
    {
        _1220 = _1186;
    }
    float _1242 = _1220;
    float _1244 = _1242;
    if (!_1214)
    {
        _1222 = _1210;
    }
    float _1246 = _1222;
    bool _1248 = !_1214;
    float _1250 = _1246;
    if (!_1248)
    {
        float _1252 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1254 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1256 = _1212 + _1254;
        float _1258 = _1210 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1260 = rsqrt(_1208);
        float _1262 = _1256 * _1252;
        float _1264 = _1262 * 0.15915493667125701904296875;
        float _1266 = _1264 * 6.283185482025146484375;
        float _1268 = sin(_1266);
        float _1270 = _1264 * 6.283185482025146484375;
        float _1272 = cos(_1270);
        float _1274 = fma(_1268, _1258, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1276 = _1260 * _1274;
        float _1278 = _1272 + (-1.0);
        float _1280 = _1278 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1282 = _1192 * _1276;
        float _1284 = _1196 * _1276;
        float _1286 = fma(_1210, _1272, _1280);
        float _1288 = _1282 + (*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1290 = _1284 + (*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1292 = _1282 * _1282;
        float _1294 = _1284 * _1284;
        _1250 = _1286;
        _1236 = _1292;
        _1232 = _1294;
        _1240 = _1288;
        _1244 = _1290;
    }
    float _1296 = _1250;
    float _1298 = _1236;
    float _1300 = _1232;
    float _1302 = _1240;
    float _1304 = _1244;
    float _1306 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1308 = _1296 + _1306;
    out.m_63.x = _950;
    out.m_63.y = _952;
    out.m_63.z = _954;
    float _1310 = fma(_1308, _1308, _1298);
    float _1312 = _1310 + _1300;
    float _1314 = sqrt(_1312);
    bool _1316 = _1314 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1318 = isnan(_1314);
    bool _1320 = _1316 || _1318;
    bool _1322 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1324 = _1320 || _1322;
    float _1326 = _1298;
    if (!_1324)
    {
        _1326 = 1.0;
    }
    float _1328 = _1326;
    bool _1330 = !_1324;
    float _1332 = _1328;
    if (!_1330)
    {
        bool _1334 = _1314 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1336 = isnan(_1314);
        bool _1338 = _1334 || _1336;
        bool _1340 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1342 = _1338 || _1340;
        if (!_1342)
        {
            float _1344 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1346 = _1314 + _1344;
            float _1348 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1350 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1348;
            float _1352 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1354 = _1352 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1356 = 1.0 / _1350;
            float _1358 = _1346 * _1356;
            float _1360 = fma(_1358, _1354, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1332 = _1360;
            _1362 = true;
        }
        else
        {
            bool _1364 = _1314 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1366 = isnan(_1314);
            bool _1368 = _1364 || _1366;
            bool _1370 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1372 = _1368 || _1370;
            if (!_1372)
            {
                float _1374 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1376 = _1314 + _1374;
                float _1378 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1380 = _1378 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1382 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1384 = _1382 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1386 = 1.0 / _1380;
                float _1388 = _1376 * _1386;
                float _1390 = fma(_1388, _1384, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1332 = _1390;
                _1362 = true;
            }
            else
            {
                _1332 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1362 = false;
    float _1392 = _1332;
    float _1394 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1396 = _1296 + _1394;
    float _1398 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1400 = _1302 + _1398;
    float _1402 = fma(_1396, _1392, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1404 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1406 = _1304 + _1404;
    float _1408 = fma(_1400, _1392, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1410 = -_744;
    float _1412 = fma(_1410, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1402);
    float _1414 = fma(_1406, _1392, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1416 = -_760;
    float _1418 = fma(_1416, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1408);
    float _1420 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1422 = _1412 + _1420;
    float _1424 = -_792;
    float _1426 = fma(_1424, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1414);
    float _1428 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1430 = _1418 + _1428;
    float _1432 = _1422 * _1422;
    float _1434 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1436 = _1426 + _1434;
    float _1438 = fma(_1430, _1430, _1432);
    float _1440 = fma(_1436, _1436, _1438);
    float _1442 = rsqrt(_1440);
    float _1444 = _1442 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1446 = _1430 * _1444;
    float _1448 = _1436 * _1444;
    float _1450 = _1446 * _1446;
    float _1452 = _1448 * _1448;
    float _1454 = _1450 + _1452;
    float _1456 = sqrt(_1454);
    bool _1458 = _1456 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1460 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1462 = _1456 + _1460;
    float _1464 = _1436;
    float _1466 = _1454;
    float _1468 = _1462;
    float _1470 = _1446;
    if (_1458)
    {
        float _1472 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1464 = _1472;
    }
    float _1474 = _1464;
    if (_1458)
    {
        float _1476 = rsqrt(_1454);
        _1466 = _1476;
    }
    float _1478 = _1466;
    float _1480 = _1478;
    if (_1458)
    {
        float _1482 = _1462 * _1474;
        _1468 = _1482;
    }
    float _1484 = _1468;
    if (_1458)
    {
        float _1486 = _1484 * 0.15915493667125701904296875;
        _1224 = _1486;
    }
    float _1488 = _1224;
    float _1490 = _1442;
    if (_1458)
    {
        float _1492 = _1488 * 6.283185482025146484375;
        float _1494 = sin(_1492);
        _1490 = _1494;
    }
    float _1496 = _1490;
    float _1498 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1500 = precise::max(0.0, _1498);
    float _1502 = _1310;
    float _1504 = _1500;
    float _1506 = _1498;
    if (_1458)
    {
        float _1508 = _1488 * 6.283185482025146484375;
        float _1510 = cos(_1508);
        _1502 = _1510;
    }
    float _1512 = _1502;
    float _1514 = -_1444;
    float _1516 = -_1500;
    float _1518 = fma(_1422, _1514, _1516);
    if (_1458)
    {
        float _1520 = _1518 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1504 = _1520;
    }
    float _1522 = _1504;
    float _1524 = sqrt(_1440);
    float _1526 = _1496;
    float _1528 = _1522;
    if (_1458)
    {
        float _1530 = fma(_1496, _1522, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1526 = _1530;
    }
    float _1532 = _1526;
    float _1534 = _1532;
    if (!_1458)
    {
        _1528 = _1448;
    }
    float _1536 = _1528;
    float _1538 = _1536;
    if (_1458)
    {
        float _1540 = _1512 + (-1.0);
        _1506 = _1540;
    }
    float _1542 = _1506;
    float _1544 = _1542;
    if (_1458)
    {
        float _1546 = _1478 * _1532;
        _1226 = _1546;
    }
    float _1548 = _1226;
    if (!_1458)
    {
        _1534 = _1518;
    }
    float _1550 = _1534;
    float _1552 = _1550;
    if (_1458)
    {
        float _1554 = _1542 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1228 = _1554;
    }
    float _1556 = _1228;
    if (_1458)
    {
        float _1558 = _1446 * _1548;
        _1470 = _1558;
    }
    float _1560 = _1470;
    if (!_1458)
    {
        _1480 = _1450;
    }
    float _1562 = _1480;
    float _1564 = _1562;
    if (_1458)
    {
        float _1566 = _1448 * _1548;
        _1538 = _1566;
    }
    float _1568 = _1538;
    if (_1458)
    {
        float _1570 = fma(_1518, _1512, _1556);
        _1552 = _1570;
    }
    float _1572 = _1552;
    if (_1458)
    {
        float _1574 = _1560 * _1560;
        _1564 = _1574;
    }
    float _1576 = _1564;
    if (!_1458)
    {
        _1544 = _1452;
    }
    float _1578 = _1544;
    float _1580 = _1578;
    if (_1458)
    {
        float _1582 = _1568 * _1568;
        _1580 = _1582;
    }
    float _1584 = _1580;
    float _1586 = fma(_1572, _1572, _1576);
    float _1588 = _1586 + _1584;
    float _1590 = _1412 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1592 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1594 = fma(_1524, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1592);
    float _1596 = precise::clamp(_1594, 0.0, 1.0);
    float _1598 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1600 = rsqrt(_1588);
    float _1602 = fma(_1418, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1590);
    float _1604 = _1412 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1606 = -_1596;
    float _1608 = _1606 + 1.0;
    float _1610 = _1412 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1612 = fma(_1426, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1602);
    float _1614 = fma(_1418, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1604);
    float _1616 = _1412 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1618 = fma(_1418, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1610);
    float _1620 = _1612 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1622 = fma(_1426, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1614);
    float _1624 = abs(_1608);
    float _1626 = log2(_1624);
    float _1628 = fma(_1426, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1618);
    float _1630 = _1620 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1632 = fma(_1418, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1616);
    float _1634 = _1622 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1636 = _1600 * _1560;
    float _1638 = -_1630;
    float _1640 = fma(_1638, _1598, 1.0);
    float _1642 = _1628 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1644 = _1600 * _1572;
    float _1646 = _1636 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1648 = fma(_1426, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1632);
    float _1650 = _1634 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1652 = _1600 * _1568;
    float _1654 = -_1646;
    float _1656 = fma(_1644, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1654);
    float _1658 = _1648 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1660 = fma(_1642, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1650);
    float _1662 = _1626 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1664 = -_1652;
    float _1666 = fma(_1664, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1656);
    float _1668 = log2(_1640);
    float _1670 = fma(_1620, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1660);
    float _1672 = _1634 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1674 = fma(_1666, -0.5, 0.5);
    float _1676 = _1634 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1678 = fma(_1658, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1670);
    float _1680 = fma(_1666, 0.5, 0.5);
    float _1682 = fma(_1642, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1672);
    float _1684 = exp2(_1662);
    float _1686 = fma(_1642, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1676);
    float _1688 = _1644 + 1.0;
    float _1690 = fma(_1680, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1692 = fma(_1620, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1682);
    float _1694 = fma(_1620, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1686);
    float _1696 = fma(_1680, _1690, -0.212114393711090087890625);
    float _1698 = 1.0 / _1678;
    float _1700 = fma(_1658, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1694);
    float _1702 = _1668 * 0.693147182464599609375;
    float _1704 = fma(_1680, _1696, 1.570728778839111328125);
    float _1706 = _1702 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1708 = sqrt(_1674);
    float _1710 = -_1644;
    float _1712 = fma(_1684, _1688, _1710);
    float _1714 = fma(_1658, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1692);
    float _1716 = fma(_1712, 0.5, 0.5);
    float _1718 = _1714 * _1698;
    float _1720 = _1700 * _1698;
    float _1722 = fma(_1718, 0.5, 0.5);
    float _1724 = fma(_1720, -0.5, 0.5);
    float _1726 = _1708 * 0.636619746685028076171875;
    float _1728 = -_1704;
    float _1730 = fma(_1726, _1728, 1.0);
    float3 _4539 = float3(_1722, _1724, _1706);
    float _1732 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4539, float3(0.0), isnan(_4539)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4539, float3(0.0), isnan(_4539)), level(0.0)).x;
    float3 _4550 = float3(_1722, _1724, _1706);
    float4 _1735 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4550, float3(0.0), isnan(_4550)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4550, float3(0.0), isnan(_4550)), level(0.0)).xyzw;
    float _1737 = _1735.x;
    float _1739 = _1735.y;
    float _1741 = _1735.z;
    float _1743 = _1735.w;
    float2 _4567 = float2(_1730, _1716);
    float3 _1745 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4567, float2(0.0), isnan(_4567)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4567, float2(0.0), isnan(_4567)), level(0.0)).xyz;
    float _1747 = _1745.x;
    float _1749 = _1745.y;
    float _1751 = _1745.z;
    float _1753 = -_744;
    float _1755 = fma(_1753, (*spvDescriptorSet0.vp_c9)._m0[18].w, _558);
    float _1757 = -_760;
    float _1759 = fma(_1757, (*spvDescriptorSet0.vp_c9)._m0[18].w, _560);
    float _1761 = -_792;
    float _1763 = fma(_1761, (*spvDescriptorSet0.vp_c9)._m0[18].w, _578);
    float _1765 = _1755 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1767 = fma(_1759, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1765);
    float _1769 = _1755 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1771 = fma(_1763, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1767);
    float _1773 = fma(_1759, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1769);
    float _1775 = _1626 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _1777 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1779 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1781 = _1777 || _1779;
    bool _1783 = isnan(0.5);
    bool _1785 = _1781 || _1783;
    float _1787 = _1771 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1789 = fma(_1763, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1773);
    float _1791 = _1634 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1793 = exp2(_1775);
    float _1795 = _1789 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1797 = fma(_1642, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1791);
    float _1799 = _1795 + _1787;
    float _1801 = fma(_1620, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1797);
    float _1803 = 1.0 / _1787;
    float _1805 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    if (_1785)
    {
        _1805 = 1.0;
    }
    float _1807 = _1805;
    float _1809 = fma(_1658, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1801);
    float _1811 = _1799 * _1803;
    float _1813 = _1811 * 0.5;
    float _1815 = _1807;
    if (!_1785)
    {
        float _1817 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1819 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1821 = fma(_1813, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1819);
        float _1823 = _1817 * 0.15915493667125701904296875;
        float _1825 = _1823 * 6.283185482025146484375;
        float _1827 = cos(_1825);
        float _1829 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1831 = _1829 * 0.15915493667125701904296875;
        float _1833 = _1823 * 6.283185482025146484375;
        float _1835 = sin(_1833);
        float _1837 = 1.0 / _1827;
        float _1839 = _1831 * 6.283185482025146484375;
        float _1841 = cos(_1839);
        float _1843 = _1835 * _1837;
        float _1845 = 1.0 / _1821;
        float _1847 = _1841 * _1843;
        float _1849 = _1831 * 6.283185482025146484375;
        float _1851 = sin(_1849);
        float _1853 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1855 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1853;
        float _1857 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1859 = _1845 * _1857;
        float _1861 = 1.0 / _1847;
        float _1863 = 1.0 / _1855;
        float _1865 = _1851 * _1861;
        float _1867 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1869 = fma(_1865, _1859, _1867);
        float _1871 = _1869 * _1863;
        float _1873 = precise::clamp(_1871, 0.0, 1.0);
        float _1875 = -_1873;
        float _1877 = _1875 + 1.0;
        _1815 = _1877;
    }
    float _1879 = _1815;
    float _1881 = _1809 + _1678;
    float _1883 = -_1793;
    float _1885 = _1883 + 1.0;
    bool _1887 = _1879 > 0.0;
    bool _1889 = isnan(_1879);
    bool _1891 = _1887 || _1889;
    bool _1893 = isnan(0.0);
    bool _1895 = _1891 || _1893;
    float _1897 = _1879 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1899 = _1881 * 0.5;
    float _1901 = _1885 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1903 = _1897 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1905 = _1901 * _1732;
    float _1907 = -_1901;
    float _1909 = _1907 + 1.0;
    out.gl_Position.x = _1714;
    out.gl_Position.y = _1700;
    out.gl_Position.z = _1809;
    out.gl_Position.w = _1678;
    float _1911 = _1743 * _1905;
    float _1913 = _1751 * _1905;
    out.m_65.z = _1899;
    out.m_65.w = _1678;
    float _1915 = fma(_1747, _1911, _1737);
    float _1917 = fma(_1749, _1911, _1739);
    float _1919 = _1743 * _1909;
    float _1921 = fma(_1743, _1913, _1741);
    out.m_49.x = _1903;
    out.m_67.x = _1915;
    out.m_67.y = _1917;
    out.m_67.z = _1921;
    out.m_67.w = _1919;
    if (_1895)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_49.x = 0.0;
    float _1923 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1923;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

